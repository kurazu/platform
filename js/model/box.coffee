define [], () ->
    "use strict"

    class Box
        constructor: (@minX, @maxX, @minY, @maxY) ->
        isColliding: (other) ->
            return other.minX < @maxX and @minX < other.maxX and
                other.minY < @maxY and @minY < other.maxY

