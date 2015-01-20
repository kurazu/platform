define ['util/loop', 'controller/level', 'util/trigger', 'controller/player'], (run_loop, Level, Trigger, Player) ->
    "use strict"

    class Game extends Trigger
        constructor: (@elem) ->
            super()
            @player = new Player()
        handlers:
            error: 'onError'
        start: () ->
            @prepare()
        run: () ->
            run_loop @step.bind(@), 8, 64
        step: (diff) ->
            seconds = diff / 1000
            @player.act seconds
        prepare: () ->
            level = new Level '01'
            level.on 'load', (@level, elem) =>
                @elem.appendChild elem
                @level.dropPlayer @player
            level.on 'ready', (level) =>
                @run()
            level.bubble 'error', @
            level.load()
        onError: (what, args...) ->
            console.log 'game error', args...

