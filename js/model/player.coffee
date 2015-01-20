define ['model/object'], (ObjectModel) ->
    "use strict"

    class PlayerModel extends ObjectModel
        width: 1
        height: 2
        x_offset: -0.5
        y_offset: +2
        constructor: () ->
            super()
