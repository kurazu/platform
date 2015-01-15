define ['util/dom'], (dom) ->

    class BlockView
        constructor: (level_elem, @model) ->
            @elem = dom.child_div level_elem, "block #{model.className}"
            styles =
                left: dom.px BlockView.BLOCK_SIZE * @model.x
                top: dom.px BlockView.BLOCK_SIZE * @model.y
            dom.style @elem, styles

    BlockView.BLOCK_SIZE = 40

    return BlockView
