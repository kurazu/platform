define ['util/loop', 'controller/screen', 'controller/level'], (run_loop, Screen, Level) ->

    class Game
        constructor: (@elem) ->
        start: () ->
            @prepare()
        run: () ->
            run_loop @step.bind(@), 8, 64
        step: (diff) ->
            console.log 'step'
        prepare: () ->
            @level = new Level '01'
            @level.on 'load', @run.bind @
            @level.on 'error', @onError.bind @
            @level.load @run.bind @
        onError: (what, args...) ->
            console.log 'game error', args...

