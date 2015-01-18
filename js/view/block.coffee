define ['util/dom', 'util/constants'], (dom, constants) ->
    "use strict"

    class BlockView
        constructor: (level_elem, @displayTransform, @model) ->
            @elem = dom.child_div level_elem, "block #{model.className}"
            [transformed_x, transformed_y] = @displayTransform @model.x, @model.y
            styles =
                left: dom.px transformed_x
                top: dom.px transformed_y
            dom.style @elem, styles
