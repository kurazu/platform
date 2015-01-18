define ['util/trigger', 'model/object'], (Trigger, ObjectModel) ->

    class PlayerModel extends ObjectModel
        width: 1
        height: 2
        x_offset: -0.5
        y_offset: +2
        constructor: () ->
            super()
            @initTrigger()
        put: (@x, @y) ->
            @trigger 'move', x, y

    Trigger.poisonClass PlayerModel

    return PlayerModel
