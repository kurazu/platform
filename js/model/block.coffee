define ['model/object'], (ObjectModel) ->
    "use strict"

    class BlockModel extends ObjectModel
        width: 1
        height: 1
        x_offset: -0.5
        y_offset: +0.5
        constructor: (@x, @y, @solid, @className) ->
