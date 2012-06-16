class Galaxy extends Game
  load: ->
    super()

    @gamestate.stars = []

    Map.load(@gamestate,Map.testmap)

  update: (deltat)->
    for star in @gamestate.stars
      star.update(deltat)
    true
