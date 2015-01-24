define ['model/level', 'view/level', 'util/trigger', 'util/ajax', 'controller/block', 'util/matrix', 'util/constants'], (LevelModel, LevelView, Trigger, ajax, Block, matrix, constants) ->
    "use strict"

    class Level extends Trigger
        constructor: (@name) ->
            super()
        handlers:
            data_load: 'onDataLoad'
            model_load: 'onModelLoad'
        load: () ->
            level_description_path = "#{constants.LEVEL_DATA_PATH}#{@name}.json"
            level_data_path = "#{constants.LEVEL_DATA_PATH}#{@name}.txt"
            description_ajax = new ajax.JSONAjax level_description_path
            data_ajax = new ajax.TextAjax level_data_path
            description_ajax.on 'load', (ajax, description) =>
                data_ajax.on 'load', (ajax, data) =>
                    @trigger 'data_load', description, data
                data_ajax.bubble 'error', @
                data_ajax.request()
            description_ajax.bubble 'error', @
            description_ajax.request()
        onDataLoad: (what, description, data) ->
            model = new LevelModel @name, description, data
            model.chain 'load', @, 'model_load'
            model.bubble 'error', @
            model.parse()
        onModelLoad: (@model, lines) ->
            @view = new LevelView model
            elem = @view.elem
            matrix.map lines, (x, y, char) =>
                if not char or char == ' '
                    return undefined
                else
                    block = new Block char, x, y
                    @view.nestView block.view
                    return block
            @trigger 'load', elem
        dropPlayer: (@player) ->
            @view.nestView player.view
            player.put @model.playerX, @model.playerY
            @trigger 'ready'
        animate: (player, seconds) ->
            model = player.model
            {x: current_x, y: current_y, velocity: velocity} = model

            # First we calculate the desired target position
            frameVelocity = velocity.scale seconds
            {dx: dx, dy: dy} = frameVelocity.toDxDy()

            new_x = current_x + dx
            new_y = current_y + dy

            model.move new_x, new_y

