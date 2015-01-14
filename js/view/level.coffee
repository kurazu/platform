define ['util/trigger', 'util/dom', 'util/matrix', 'util/async'], (Trigger, dom, matrix, async) ->
    class LevelView extends Trigger
        constructor: (@model) ->
            super()
        create: async.defer () ->
            level_elem = dom.div 'level'

            @block_views = matrix.map @model.rows, (x, y, block_model) ->
                new BlockView level_elem, x, y, block_model
                # block_elem = dom.child_div level_elem, "block #{block.className}"
                # dom.style block_elem, {top: }

            @trigger 'load', elem
