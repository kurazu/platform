define ['model/level', 'view/level', 'util/trigger', 'util/ajax', 'controller/block', 'util/matrix'], (LevelModel, LevelView, Trigger, ajax, Block, matrix) ->
    LEVEL_DATA_PATH = 'asset/levels/'

    class Level extends Trigger
        constructor: (@name) ->
            super()
        handlers:
            data_load: 'onDataLoad'
            model_load: 'onModelLoad'
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
        onModelLoad: (@model, lines) ->
            @view = new LevelView model
            elem = @view.elem
            matrix.map lines, (x, y, char) ->
                new Block elem, char, x, y
            @trigger 'load', elem
