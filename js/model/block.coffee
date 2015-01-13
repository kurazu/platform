define [], () ->

    class Block
        solid: false
        className: 'empty'
        constructor: (@x, @y) ->

    class SolidBlock extends Block
        solid: true

    BLOCK = (baseClass, className) ->
        class ExtendedBlock extends baseClass
            className: className

    Block.create = (char, x, y) ->
        Constructor = BLOCKS[char if char else ' ']
        return new Constructor x, y

    BLOCKS =
        ' ': BLOCK Block, 'empty'
        '?': BLOCK SolidBlock, 'block'
        '#': BLOCK SolidBlock, 'ground'
        '-': BLOCK SolidBlock, 'brick'
        '[': BLOCK SolidBlock, 'pipe-top-left'
        ']': BLOCK SolidBlock, 'pipe-top-right'
        ')': BLOCK SolidBlock, 'pipe-left'
        '(': BLOCK SolidBlock, 'pipe-right'
        'f': BLOCK Block, 'flower'
        'e': BLOCK SolidBlock, 'box'
        's': BLOCK SolidBlock, 'solid'
        '=': BLOCK SolidBlock, 'pipe-top'
        '_': BLOCK SolidBlock, 'pipe-bottom'
        'p': BLOCK SolidBlock, 'pipe-left-top'
        'b': BLOCK SolidBlock, 'pipe-left-bottom'
        'q': BLOCK SolidBlock, 'pipe-right-top'
        'd': BLOCK SolidBlock, 'pipe-right-bottom'
        'Q': BLOCK SolidBlock, 'pipe-joint-left-top'
        'D': BLOCK SolidBlock, 'pipe-joint-left-bottom'
        'P': BLOCK SolidBlock, 'pipe-joint-right-top'
        'B': BLOCK SolidBlock, 'pipe-joint-right-bottom'
        '|': BLOCK SolidBlock, 'pole'
        '.': BLOCK SolidBlock, 'pole-tip'
        'w': BLOCK SolidBlock, 'castle-wall'
        'f': BLOCK SolidBlock, 'castle-flank'
        'v': BLOCK SolidBlock, 'castle-wall-flank'

    return Block
