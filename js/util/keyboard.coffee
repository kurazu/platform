define [], () ->
    "use strict"

    class Keyboard
        constructor: (elem) ->
            @pressed = {}
            elem.addEventListener 'keydown', @onKeyDown.bind @
            elem.addEventListener 'keyup', @onKeyUp.bind @
        onKeyDown: (evt) ->
            @pressed[evt.keyCode] = true
            return
        onKeyUp: (evt) ->
            @pressed[evt.keyCode] = false
            return
        isUpPressed: () ->
            return @pressed[Keyboard.KEYS.UP]
        isDownPressed: () ->
            return @pressed[Keyboard.KEYS.DOWN]
        isLeftPressed: () ->
            return @pressed[Keyboard.KEYS.LEFT]
        isRightPressed: () ->
            return @pressed[Keyboard.KEYS.RIGHT]
        isSpacePressed: () ->
            return @pressed[Keyboard.KEYS.SPACE]

    Keyboard.KEYS =
        UP: 38
        DOWN: 40
        LEFT: 37
        RIGHT: 39
        SPACE: 32

    return Keyboard
