require ['controller/game'], (Game) ->
    screen = document.getElementById 'screen'
    game = new Game screen
    game.start()
