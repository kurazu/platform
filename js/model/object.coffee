define ['util/trigger', 'util/vector', 'model/box'], (Trigger, Vector, Box) ->
    "use strict"

    class ObjectModel extends Trigger
        width: 1
        height: 1
        xOffset: -0.5
        yOffset: +0.5
        box: null
        constructor: (@x=0, @y=0) ->
            super()
            @velocity = new Vector 0, 0
            @halfWidth = @width / 2
            @halfHeight = @height / 2
            @on 'move', @clearBoxCache.bind @
        clearBoxCache: () ->
            @box = null
        getDrawPoint: () ->
            return {
                x: @getMinX(),
                y: @getMaxY()
            }
        getMinX: (x=@x) ->
            return x + @xOffset
        getMaxY: (y=@y) ->
            return y + @yOffset
        getBox: (x=@x, y=@y) ->
            if @box and x == @x and y == @y
                return @box

            minX = @getMinX(x)
            maxX = minX + @width
            maxY = @getMaxY(y)
            minY = maxY - @height

            return new Box minX, maxX, minY, maxY
        put: (@x, @y) ->
            @trigger 'move', x, y
        push: (dx, dy) ->
            @put @x + dx, @y + dy
        move: (@x, @y) ->
            @trigger 'move', x, y
