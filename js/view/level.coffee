define ['util/trigger', 'util/dom', 'util/matrix', 'util/async', 'util/constants'], (Trigger, dom, matrix, async, constants) ->
    "use strict"

    class LevelView extends Trigger

        constructor: (@model) ->
            super()
            @elem = dom.div 'level'
            styles =
                width: dom.px constants.BLOCK_SIZE * @model.width
                height: dom.px constants.BLOCK_SIZE * @model.height
                marginTop: dom.px -(@model.height - constants.SCREEN_VERTICAL_BLOCKS) * constants.BLOCK_SIZE
                marginLeft: dom.px 0
            dom.style @elem, styles
        _displayTransform: (x, y) ->
            # Transform x, y coordinates into pixel-on-screen coordinates.
            transformed_x = x * constants.BLOCK_SIZE
            transformed_y = (@model.height - y) * constants.BLOCK_SIZE
            return [transformed_x, transformed_y]
        displayTransform: (model) ->
            {x: x, y: y} = model.getDrawPoint()
            return @_displayTransform x, y
        getDisplayTransform: () ->
            return @displayTransform.bind @
