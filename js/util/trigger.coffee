define [], () ->
    class Trigger
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

    Trigger.poisonClass = (cls) ->
        return this.poisonInstance cls::

    Trigger.poisonInstance = (instance) ->
        for own attr, method of Trigger::
            instance[attr] = method
        return instance

    return Trigger


