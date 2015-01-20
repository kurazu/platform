define ['util/trigger'], (Trigger) ->
    "use strict"

    class ObjectView extends Trigger
        constructor: (@model) ->
            super()
            @on 'nested', @.onNested.bind @
            @elem = @createElement()
        createElement: () ->
            throw Error 'NotImplemented'
        getMainElement: () ->
            return @elem
        nestView: (childView) ->
            childView.chain 'move', @, 'childMove'
            parentElem = @getMainElement()
            childElement = childView.getMainElement()
            parentElem.appendChild childElement
            childView.trigger 'nested', parent
        onNested: () ->
            @trigger 'move', @model
