define ['util/trigger', 'util/vector'], (Trigger, Vector) ->
    "use strict"

    class ObjectModel extends Trigger
        width: 1
        height: 1
        x_offset: -0.5
        y_offset: +0.5
        will: new Vector 0, 0
        constructor: (@x=0, @y=0) ->
            super()
            @half_width = @width / 2
            @half_height = @height / 2
        getDrawPoint: () ->
            return {
                x: @getMinX(),
                y: @getMaxY()
            }
        getMinX: () ->
            return @x + @x_offset
        getMaxY: () ->
            return @y + @y_offset
        getBox: () ->
            min_x = @getMinX()
            max_x = min_x + @width
            max_y = @getMaxY()
            min_y = max_y - @height
            return {
                min_x: min_x
                max_x: max_x
                min_y: min_y
                max_y: max_y
            }
        put: (@x, @y) ->
            @trigger 'move', x, y
        push: (dx, dy) ->
            @put @x + dx, @y + dy
        clearWill: () ->
            @will = new Vector 0, 0
        addWill: (will) ->
            @will = @will.add will
