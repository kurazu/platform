define [], () ->
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
