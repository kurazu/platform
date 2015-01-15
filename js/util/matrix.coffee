define [], () ->
    matrix =
        map: (matrix, callback) ->
            Array::map.call matrix, (row, y) ->
                Array::map.call row, (cell, x) ->
                    callback x, y, cell
        check_dim: (matrix, width, height) ->
            return false if matrix.length < height
            for row in matrix
                return false if row.length < width
            return true


