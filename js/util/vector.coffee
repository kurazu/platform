define [], () ->
    "use strict"

    class Vector
        constructor: (@angle, @length) ->
        add: (other) ->
            dx = @toDx() + other.toDx()
            dy = @toDy() + other.toDy()
            return Vector.fromDxDy dx, dy
        addInplace: (other) ->
            result = @add other
            @angle = result.angle
            @length = result.length
            return @
        toDx: () ->
            return @length * Math.cos @angle
        toDy: () ->
            return @length * Math.sin @angle
        toDxDy: () ->
            dx = @length * Math.cos @angle
            dy = @length * Math.sin @angle
            return {
                dx: @toDx()
                dy: @toDy()
            }
        scale: (factor) ->
            return new Vector @angle, @length * factor
        scaleInplace: (factor) ->
            @length *= factor
            return @
        decomposeAlong: (vector) ->
            phi = @angle - vector.angle

            alongLength = @length * Math.cos phi
            alongVector = new Vector vector.angle, alongLength

            perpendicularLength = @length * Math.sin phi
            perpendicularVector = new Vector vector.angle + (Math.PI / 2), perpendicularLength # +/- ?

            return {
                along: alongVector,
                perpendicular: perpendicularVector
            }

    Vector.composeDxDy = (vectors) ->
        dx = 0
        dy = 0
        for vector in vectors
            {dx: vectorDx, dy: vectorDy} = vector.toDxDy()
            dx += vectorDx
            dy += vectorDy
        return {
            dx: dx,
            dy: dy
        }

    Vector.compose = (vectors) ->
        {dx: dx, dy: dy} = Vector.composeDxDy vectors
        return Vector.fromDxDy dx, dy

    Vector.fromDxDy = (dx, dy) ->
        length = Math.sqrt dx * dx + dy * dy
        angle = Math.asin dy / length

        # compensate for cyclometric functions not working full angle range
        angle = Math.PI - angle if dx < 0

        return new Vector angle, length

    return Vector
