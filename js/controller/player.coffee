define ['model/player', 'view/player', 'util/keyboard', 'util/trigger'], (PlayerModel, PlayerView, Keyboard, Trigger) ->
    "use strict"

    class Player extends Trigger
        constructor: () ->
            super()
            @model = new PlayerModel()
            @model.chain 'move', @, 'move'
            @view = new PlayerView @model
            @keyboard = new Keyboard document
            @model.on 'move', (model) =>
                @view.trigger 'move', model
        put: (x, y) ->
            @model.put x, y
        act: (seconds) ->
            keyboard = @keyboard
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

