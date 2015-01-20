define ['util/dom', 'util/constants'], (dom, constants) ->
    "use strict"

    class BlockView
        constructor: (level_elem, @model) ->
            @elem = dom.child_div level_elem, "block #{model.className}"
