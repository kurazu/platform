define ['util/trigger', 'util/dom', 'util/matrix', 'util/async', 'util/constants'], (Trigger, dom, matrix, async, constants) ->
    "use strict"

    class LevelView extends Trigger
        constructor: (@model) ->
            super()
            @elem = dom.div 'level'
            styles =
                width: dom.px constants.BLOCK_SIZE * @model.width
                height: dom.px constants.BLOCK_SIZE * @model.height
            dom.style @elem, styles
