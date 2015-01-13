define ['util/trigger', 'model/block'], (Trigger, Block) ->
    class LevelModel extends Trigger
        constructor: (@name, @description, @data) ->
            super()
        parse: () ->
            try
                @parseDescription()
            catch ex
                return @trigger 'error', 'description parsing', ex
            try
                @parseRows()
            catch ex
                return @trigger 'error', 'rows parsing', ex

            @trigger 'load'
        parseDescription: () ->
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
            @rows = []
            lines = @data.split '\n'
            if not lines.length >= @height
                throw new Error 'too few lines'
            for y in [0...@height]
                line = lines[y]
                row = []
                for x in [0...@width]
                    char = line[x]
                    @row.push Block.create char
                @rows.push row
            return
