define ['model/player', 'view/player', 'util/keyboard', 'util/trigger', 'util/vector'], (PlayerModel, PlayerView, Keyboard, Trigger, Vector) ->
    "use strict"

    VECTOR_LEFT = new Vector Math.PI, 1
    VECTOR_RIGHT = new Vector 0, 1
    VECTOR_JUMP = new Vector 0, 2
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
            wills = []
            keyboard = @keyboard
            if keyboard.isRightPressed()
                wills.push VECTOR_RIGHT
            else if keyboard.isLeftPressed()
                wills.push  VECTOR_LEFT
            if keyboard.isSpacePressed()
                wills.push VECTOR_JUMP
            wills.push VECTOR_GRAVITY

            will = Vector.compose wills
            will.scaleInplace seconds

            {dx: dx, dy: dy} = will.toDxDy()

            @model.push dx, dy
            return

