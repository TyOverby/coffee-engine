class Galaxy extends Game
  load: ->
    super()

    @gamestate.stars = []
    @stars = @gamestate.stars

    for i in [0...10]
      @stars.push(
        new Star(
          {x: Math.randInt(100),y: Math.randInt(100)},
          12))
    true

  update: (deltat)->
    for star in @stars
      do star.update
