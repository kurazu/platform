define ['util/trigger', 'util/dom', 'util/matrix', 'util/async', 'view/block'], (Trigger, dom, matrix, async, BlockView) ->

    SCREEN_HORIZONTAL_BLOCKS = 16
    SCREEN_VERTICAL_BLOCKS = 12

    class LevelView extends Trigger
        constructor: (@model) ->
            super()
            @elem = dom.div 'level'
            styles =
                width: dom.px BlockView.BLOCK_SIZE * @model.width
                height: dom.px BlockView.BLOCK_SIZE * @model.height
            dom.style @elem, styles
