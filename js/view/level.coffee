define ['util/trigger', 'util/dom', 'util/matrix'], (Trigger, dom, matrix) ->
    class LevelView extends Trigger
        constructor: (@model) ->
            super()
        create: () ->
            @elem = dom.div 'level'

            matrix.map @model.rows, (x, y, block) ->
                dom.child_div @elem, block.className

            @model.forEachBlock

            setTimeout () =>
                @trigger 'load', @elem
            , 0

