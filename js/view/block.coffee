define ['view/object', 'util/dom'], (ObjectView, dom) ->
    "use strict"

    class BlockView extends ObjectView
        createElement: () ->
            return dom.div "block #{@model.className}"
