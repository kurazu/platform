define [], () ->
    matrix =
        map: (matrix, callback) ->
            Array::map.call matrix, (row, y) ->
                Array::map.call row, (cell, x) ->
                    callback x, y, cell
