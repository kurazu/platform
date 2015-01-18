require ['controller/game'], (Game) ->
    "use strict"

    screen = document.getElementById 'screen'
    game = new Game screen
    game.start()
