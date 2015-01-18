define [], () ->
    "use strict"

    DEFAULT_CLASSNAME = ""

    dom =
        elem: (tag, className=DEFAULT_CLASSNAME) ->
            elem = document.createElement tag
            elem.className = className
            return elem
        div: (className="") ->
            @elem 'div', className
        child_elem: (parent, tag, className=DEFAULT_CLASSNAME) ->
            elem = @elem tag, className
            parent.appendChild elem
            return elem
        child_div: (parent, className=DEFAULT_CLASSNAME) ->
            @child_elem parent, 'div', className
        px: (num) ->
            "#{num}px"
        style: (elem, styles) ->
            elem_style = elem.style
            for own key, value of styles
                elem_style[key] = value
            return elem

