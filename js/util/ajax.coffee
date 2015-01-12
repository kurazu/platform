define ['util/trigger'], (Trigger) ->

    class Ajax extends Trigger
        responseType: ""
        constructor: (@url, @method='get') ->
        request: () ->
            req = new XMLHttpRequest
            req.responseType = @responseType
            req.addEventListener 'load', () =>
                response = req.response
                if response == null
                    @trigger 'error', 'null response'
                else
                    @trigger 'load', response
            req.addEventListener 'error', (args...) =>
                @trigger 'error', args...
            req.open "get", @url, true
            req.send()
            return

    class TextAjax extends Ajax
        responseType: "text"

    class JSONAjax extends Ajax
        responseType: "json"

    ajax =
        Ajax: Ajax
        TextAjax: TextAjax
        JSONAjax: JSONAjax