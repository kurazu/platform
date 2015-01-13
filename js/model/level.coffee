define ['util/trigger', 'model/block'], (Trigger, Block) ->
    class LevelModel extends Trigger
        constructor: (@name, @description, @data) ->
            super()
        parse: () ->
            return if @parseDescription() is Trigger.EXCEPTION
            return if @parseRows() is Trigger.EXCEPTION
            window.setTimeout () =>
                @trigger 'load'
            , 0
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
        parseRows: Trigger.raiseAsEvent () ->
            rows = []
            lines = @data.split '\n'
            if not lines.length >= @height
                throw new Error 'too few lines'
            for y in [0...@height]
                line = lines[y]
                row = []
                for x in [0...@width]
                    char = line[x]
                    row.push Block.create char
                rows.push row
            @rows = rows
            return
        getBlock: (x, y) ->
            throw new Error "y >= height (#{y} >= #{@height}" if y >= @height
            throw new Error "x >= height (#{x} >= #{@width}" if x >= @width
            return @rows[y][x]
        forEachBlock: (callback) ->
            for y in [0...@height]
                row = @rows[y]
                for x in [0...@width]
                    block = row[x]
                    callback x, y, block
            return
