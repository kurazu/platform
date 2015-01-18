define [], () ->
    class Trigger
        handlers: {}
        constructor: () ->
            @initTrigger()
        initTrigger: () ->
            @observers = {}
            for own eventName, handlerName of @handlers
                handler = @[handlerName].bind @
                @on eventName, handler
            return
        getOrCreateObservers: (eventName) ->
            if not @observers.hasOwnProperty eventName
                @observers[eventName] = []
            return @observers[eventName]
        on: (eventName, handler) ->
            observers = @getOrCreateObservers eventName
            observers.push handler
            return
        _trigger: (eventName, source, args...) ->
            observers = @getOrCreateObservers eventName
            for observer in observers
                result = observer source, args...
                if result is false
                    return false
            return true
        trigger: (eventName, args...) ->
            @_trigger eventName, @, args...
        chain: (eventName, target, targetEventName) ->
            @on eventName, (self, args...) =>
                target._trigger targetEventName, @, args...
        bubble: (eventName, target) ->
            @chain eventName, target, eventName

    Trigger.poisonClass = (cls) ->
        @poisonInstance cls::
        return cls

    Trigger.poisonInstance = (instance) ->
        for own attr, method of Trigger::
            instance[attr] = method
        return instance

    Trigger.raiseAsEvent = (method) ->
        () ->
            try
                return method.apply @, arguments
            catch ex
                @trigger 'error', 'Exception raised in', method, ex
                return Trigger.EXCEPTION

    Trigger.EXCEPTION = {}


    return Trigger


