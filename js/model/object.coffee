define [], () ->
    "use strict"

    class ObjectModel
        width: 1
        height: 1
        x_offset: -0.5
        y_offset: +0.5
        constructor: (@x=0, @y=0) ->
            @half_width = @width / 2
            @half_height = @height / 2
        getDrawPoint: () ->
            return {
                x: @getMinX(),
                y: @getMaxY()
            }
        getMinX: () ->
            @x + @x_offset
        getMaxY: () ->
            @y + @y_offset
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
