define ['model/player', 'view/player'], (PlayerModel, PlayerView) ->
    "use strict"

    class Player
        constructor: () ->
            @model = new PlayerModel()
            @view = new PlayerView @model
        put: (x, y) ->
            @model.put x, y
        setDisplayTransform: (displayTransform) ->
            @view.setDisplayTransform displayTransform
