define ['util/loop', 'controller/level', 'util/trigger'], (run_loop, Level, Trigger) ->

    class Game extends Trigger
        constructor: (@elem) ->
            super()
        handlers:
            error: 'onError'
        start: () ->
            @prepare()
        run: () ->
            run_loop @step.bind(@), 8, 64
        step: (diff) ->
            console.log 'step'
        prepare: () ->
            level = new Level '01'
            level.on 'load', (@level, elem) =>
                @elem.appendChild elem
                console.log 'game loaded'
                #@run()
            level.bubble 'error', @
            level.load()
        onError: (what, args...) ->
            console.log 'game error', args...

