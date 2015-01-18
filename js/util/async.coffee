define [], () ->
    "use strict"

    async =
        defer: (func) ->
            () ->
                args = arguments
                setTimeout () =>
                    func.apply @, args
                , 0
