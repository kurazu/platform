define ['util/dom'], (dom) ->

    BLOCK_SIZE = 40

    class BlockView
        constructor: (level_elem, @model) ->
            @elem = dom.child_div level_elem, "block #{model.className}"
            styles =
                left: dom.px BLOCK_SIZE * @model.x
                top: dom.px BLOCK_SIZE * @model.y
            dom.style @elem, styles
