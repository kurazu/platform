define ['util/dom', 'view/block'], (dom, BlockView) ->
    class PlayerView
        constructor: (@model) ->
            @elem = dom.div 'player'
            model.on 'move', @onMove.bind @
        onMove: (model, x, y) ->
            styles =
                left: dom.px BlockView.BLOCK_SIZE * x
                top: dom.px BlockView.BLOCK_SIZE * y
            dom.style @elem, styles
