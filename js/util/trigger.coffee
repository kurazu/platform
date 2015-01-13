define [], () ->
    class Trigger
        observers: {}
        handlers: {}
        constructor: () ->
            @bindHandlers()
        bindHandlers: () ->
            for own eventName, handlerName of @handlers
                handler = @[handlerName].bind @
                @on eventName, handler
            return
        getOrCreateObservers: (eventName) ->
            if not @hasOwnProperty 'observers'
                @observers = {}
            if not @observers.hasOwnProperty eventName
                @observers[eventName] = []
            return @observers[eventName]
        on: (eventName, handler) ->
            observers = @getOrCreateObservers eventName
            observers.push handler
            return
        trigger: (eventName, args...) ->
            observers = @getOrCreateObservers eventName
            for observer in observers
                result = observer @, args...
                if result == false
                    return false
            return true
        chain: (eventName, target, targetEventName) ->
            @on eventName, (self, args...) ->
                target.trigger targetEventName, args...
        bubble: (eventName, target) ->
            @chain eventName, target, eventName

    Trigger.poisonClass = (cls) ->
        return @poisonInstance cls::

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


