define ['util/trigger', 'model/block', 'util/async', 'util/matrix'], (Trigger, Block, async, matrix) ->
    class LevelModel extends Trigger
        constructor: (@name, @description, @data) ->
            super()
        parse: async.defer () ->
            return if @parseDescription() is Trigger.EXCEPTION
            @parseRows()
        parseDescription: Trigger.raiseAsEvent () ->
            {
                meta:
                    width: @width,
                    height: @height
                    player:
                        x: @playerX
                        y: @playerY
            } = @description
            return
        parseRows: () ->
            lines = @data.split '\n'
            is_valid = matrix.check_dim lines, @width, @height
            if is_valid
                reversed_lines = matrix.reverse lines
                @trigger 'load', reversed_lines
            else
                @trigger 'error', 'Dimensions not valid'
