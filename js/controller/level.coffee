define ['model/level', 'util/trigger', 'util/ajax'], (LevelModel, Trigger, ajax) ->
    LEVEL_DATA_PATH = 'asset/levels/'
    class Level extends Trigger
        constructor: (@name) ->
            @on 'data_load', @onDataLoad.bind @
        load: () ->
            level_description_path = "#{LEVEL_DATA_PATH}#{@name}.json"
            level_data_path = "#{LEVEL_DATA_PATH}#{@name}.txt"
            description_ajax = new ajax.JSONAjax level_description_path
            data_ajax = new ajax.TextAjax level_data_path
            description_ajax.on 'load', (ajax, description) =>
                data_ajax.on 'load', (ajax, data) =>
                    @trigger 'data_load', description, data
                data_ajax.on 'error', @onError.bind @
                data_ajax.request()
            description_ajax.on 'error', @onError.bind @
            description_ajax.request()
        onError: (what, args...) ->
            @trigger 'error', args...
        onDataLoad: (what, description, data) ->
            console.log description, data



