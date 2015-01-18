define [], () ->
    "use strict"

    (callback, min_ms, max_ms) ->
        prev_timestamp = +new Date
        step = (timestamp) ->
            diff = timestamp - prev_timestamp
            diff = Math.max min_ms, diff
            diff = Math.min max_ms, diff
            callback diff
            window.requestAnimationFrame step
        window.requestAnimationFrame step
