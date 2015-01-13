define ['model/level', 'view/level', 'util/trigger', 'util/ajax'], (LevelModel, LevelView, Trigger, ajax) ->
    LEVEL_DATA_PATH = 'asset/levels/'

    class Level extends Trigger
        constructor: (@name) ->
            super()
        handlers:
            data_load: 'onDataLoad'
            model_load: 'onModelLoad'
            view_load: 'onViewLoad'
        load: () ->
            level_description_path = "#{LEVEL_DATA_PATH}#{@name}.json"
            level_data_path = "#{LEVEL_DATA_PATH}#{@name}.txt"
            description_ajax = new ajax.JSONAjax level_description_path
            data_ajax = new ajax.TextAjax level_data_path
            description_ajax.on 'load', (ajax, description) =>
                data_ajax.on 'load', (ajax, data) =>
                    @trigger 'data_load', description, data
                data_ajax.bubble 'error', @
                data_ajax.request()
            description_ajax.bubble 'error', @
            description_ajax.request()
        onDataLoad: (what, description, data) ->
            model = new LevelModel @name, description, data
            model.chain 'load', @, 'model_load'
            model.bubble 'error', @
            model.parse()
        onModelLoad: (@model) ->
            view = new LevelView model
            view.chain 'load', @, 'view_load'
            view.bubble 'error', @
            view.create()
        onViewLoad: (@view) ->
            @trigger 'load'



