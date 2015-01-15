define ['util/trigger', 'util/dom', 'util/matrix', 'util/async'], (Trigger, dom, matrix, async) ->

    class LevelView extends Trigger
        constructor: (@model) ->
            super()
            @elem = dom.div 'level'
