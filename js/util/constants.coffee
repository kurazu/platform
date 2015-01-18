define [], () ->
    "use strict"

    constants =
        BLOCK_SIZE: 40
        SCREEN_HORIZONTAL_BLOCKS: 16
        SCREEN_VERTICAL_BLOCKS: 12
        LEVEL_DATA_PATH: 'asset/levels/'
        DEFAULT_DISPLAY_TRANSFORM: (x, y) ->
            return [x * BLOCK_SIZE, y * BLOCK_SIZE]


