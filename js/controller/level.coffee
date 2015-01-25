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
            @blocks = matrix.map lines, (x, y, char) =>
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
            {x: currentX, y: currentY, velocity: velocity} = model

            # First we calculate the desired target position
            frameVelocity = velocity.scale seconds
            {dx: dx, dy: dy} = frameVelocity.toDxDy()

            newX = currentX + dx
            newY = currentY + dy
            box = model.getBox newX, newY

            colliding = @findColliding box

            model.move newX, newY
            return
        findColliding: (box) ->
            minXIndex = Math.floor box.minX
            minYIndex = Math.floor box.minY
            maxXIndex = Math.ceil box.maxX
            maxYIndex = Math.ceil box.maxY

            result = []

            for x in [minXIndex..maxXIndex]
                continue if x < 0 || x >= @model.width
                for y in [minYIndex..maxYIndex]
                    continue if y < 0 || y >= @model.height
                    block = @blocks[y][x]
                    continue if not block
                    blockBox = block.model.getBox()
                    if box.isColliding blockBox
                        console.log 'collide', block
                        result.push block

            return []

