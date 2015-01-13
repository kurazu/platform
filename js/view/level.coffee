define ['util/trigger', 'util/dom'], (Trigger, dom) ->
    class LevelView extends Trigger
        constructor: (@model) ->
            super()
        create: () ->
            @elem = dom.div 'level'
            setTimeout () =>
                @trigger 'load', @elem
            , 0

