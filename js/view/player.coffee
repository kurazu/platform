define ['util/dom', 'util/constants'], (dom, constants) ->
    "use strict"

    class PlayerView
        displayTransform = constructor.DEFAULT_DISPLAY_TRANSFORM
        constructor: (@model) ->
            @elem = dom.div 'player'
            model.on 'move', @onMove.bind @
        onMove: (model, x, y) ->
            [transformed_x, transformed_y] = @displayTransform x, y
            styles =
                left: dom.px transformed_x
                top: dom.px transformed_y
            dom.style @elem, styles
        setDisplayTransform: (displayTransform) ->
            @displayTransform = displayTransform
