define ['model/block', 'view/block'], (BlockModel, BlockView) ->
    "use strict"

    class Block
        constructor: (char, x, y) ->
            [solid, className] = Block.TYPES[char or ' ']
            @model = new BlockModel x, y, solid, className
            @view = new BlockView @model


    Block.TYPES =
        ' ': [false, 'empty']
        '?': [true, 'block']
        '#': [true, 'ground']
        '-': [true, 'brick']
        '[': [true, 'pipe-top-left']
        ']': [true, 'pipe-top-right']
        ')': [true, 'pipe-left']
        '(': [true, 'pipe-right']
        'f': [false, 'flower']
        'e': [true, 'box']
        's': [true, 'solid']
        '=': [true, 'pipe-top']
        '_': [true, 'pipe-bottom']
        'p': [true, 'pipe-left-top']
        'b': [true, 'pipe-left-bottom']
        'q': [true, 'pipe-right-top']
        'd': [true, 'pipe-right-bottom']
        'Q': [true, 'pipe-joint-left-top']
        'D': [true, 'pipe-joint-left-bottom']
        'P': [true, 'pipe-joint-right-top']
        'B': [true, 'pipe-joint-right-bottom']
        '|': [true, 'pole']
        '.': [true, 'pole-tip']
        'w': [true, 'castle-wall']
        'm': [true, 'castle-flank']
        'v': [true, 'castle-wall-flank']

    return Block
