class Map
  @testmap =
    stars:
      [
        {
          pos: [0,0]
          size: 4
          aff: 0
        },

        {
          pos: [1,1]
          size: 3
          aff: 1
        },

        {
          pos: [1,2]
          size: 7
          aff: 2
        }
      ]

  @load: (gamestate,map) ->
    for star in map.stars
      gamestate.stars.push(new Star(new Vector2f(star.pos[0], star.pos[1]), star.size, star.aff))
