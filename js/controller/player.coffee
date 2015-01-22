define ['model/player', 'view/player', 'util/keyboard', 'util/trigger', 'util/vector'], (PlayerModel, PlayerView, Keyboard, Trigger, Vector) ->
    "use strict"

    VECTOR_LEFT = new Vector Math.PI, 1
    VECTOR_RIGHT = new Vector 0, 1
    VECTOR_JUMP = new Vector Math.PI / 2, 2
    VECTOR_GRAVITY = new Vector 1.5 * Math.PI, 1

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
            accelerations = []
            keyboard = @keyboard
            if keyboard.isRightPressed()
                accelerations.push VECTOR_RIGHT
            else if keyboard.isLeftPressed()
                accelerations.push  VECTOR_LEFT
            if keyboard.isSpacePressed()
                accelerations.push VECTOR_JUMP
            accelerations.push VECTOR_GRAVITY

            acceleration = Vector.compose accelerations

            velocity_change = acceleration.scale seconds

            @model.velocity.addInplace velocity_change

            frameVelocity = @model.velocity.scale seconds

            {dx: dx, dy: dy} = frameVelocity.toDxDy()

            @model.push dx, dy
            return

