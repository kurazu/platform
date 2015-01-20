define ['view/object', 'util/dom'], (ObjectView, dom) ->
    "use strict"

    class PlayerView extends ObjectView
        createElement: () ->
            return dom.div 'player'
