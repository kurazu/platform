define ['util/dom', 'util/constants'], (dom, constants) ->
    "use strict"

    class PlayerView
        constructor: (@model) ->
            @elem = dom.div 'player'
            model.on 'move', @onMove.bind @
        onMove: (model, x, y) ->
            styles =
                left: dom.px constants.BLOCK_SIZE * x
                top: dom.px constants.BLOCK_SIZE * y
            dom.style @elem, styles
