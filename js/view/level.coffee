define ['view/object', 'util/dom', 'util/constants'], (ObjectView, dom, constants) ->
    "use strict"

    class LevelView extends ObjectView
        createElement: () ->
            elem = dom.div 'level'
            styles =
                width: dom.px constants.BLOCK_SIZE * @model.width
                height: dom.px constants.BLOCK_SIZE * @model.height
                marginTop: dom.px -(@model.height - constants.SCREEN_VERTICAL_BLOCKS) * constants.BLOCK_SIZE
                marginLeft: dom.px 0
            dom.style elem, styles
            return elem
        handlers:
            childMove: 'onChildMove'
        displayTransform: (model) ->
            {x: x, y: y} = model.getDrawPoint()
            # Transform x, y coordinates into pixel-on-screen coordinates.
            transformed_x = x * constants.BLOCK_SIZE
            transformed_y = (@model.height - y) * constants.BLOCK_SIZE
            return [transformed_x, transformed_y]
        onChildMove: (childView, childModel, x, y) ->
            [transformed_x, transformed_y] = @displayTransform childModel
            styles =
                left: dom.px transformed_x
                top: dom.px transformed_y
            dom.style childView.getMainElement(), styles
