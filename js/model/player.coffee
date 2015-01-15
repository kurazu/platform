define ['util/trigger'], (Trigger) ->
    class PlayerModel extends Trigger
        constructor: (@x=0, @y=0) ->
        put: (@x, @y) ->
            @trigger 'move', x, y
