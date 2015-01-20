define [], () ->
    "use strict"

    class Point
        constructor: (@x, @y) ->
        addVector: (vector) ->
            point = vector.toPoint()
            return new Point @x + point.x, @y + point.y
