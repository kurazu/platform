define ['util/point'], (Point) ->
    "use strict"

    class Vector
        constructor: (@angle, @length) ->
        addInplace: (other) ->
            throw new Error 'NotImplemented'
        toPoint: () ->
            dx = @length * Math.cos @angle
            dy = @length * Math.sin @angle
            return new Point dx, dy
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
