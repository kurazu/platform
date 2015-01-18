define ['model/player', 'view/player', 'util/keyboard'], (PlayerModel, PlayerView, Keyboard) ->
    "use strict"

    class Player
        constructor: () ->
            @model = new PlayerModel()
            @view = new PlayerView @model
            @keyboard = new Keyboard document
        put: (x, y) ->
            @model.put x, y
        setDisplayTransform: (displayTransform) ->
            @view.setDisplayTransform displayTransform
        act: (seconds) ->
            keyboard = @keyboard
            console.log keyboard.pressed
            new_x = @model.x
            new_y = @model.y
            if keyboard.isRightPressed()
                new_x = @model.x + seconds * 2.0
            else if keyboard.isLeftPressed()
                new_x = @model.x - seconds * 2.0
            if keyboard.isSpacePressed()
                new_y = @model.y + seconds * 2.0
            @model.put new_x, new_y
            return

