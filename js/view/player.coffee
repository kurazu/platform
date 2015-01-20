define ['util/dom', 'util/constants'], (dom, constants) ->
    "use strict"

    class PlayerView
        constructor: (@model) ->
            @elem = dom.div 'player'
