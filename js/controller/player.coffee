define ['model/player', 'view/player'], (PlayerModel, PlayerView) ->
    class Player
        constructor: () ->
            @model = new PlayerModel()
            @view = new PlayerView @model
        put: (x, y) ->
            @model.put x, y
