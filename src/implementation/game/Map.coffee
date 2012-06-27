class Map
  @testmap =
    stars:
      [
        {
          id: 1
          pos: [0,0]
          size: 4
          aff: 0
          neighbors: [2, 3]
        },

        {
          id: 2
          pos: [20,10]
          size: 3
          aff: 1
          neighbors: [1]
        },

        {
          id: 3
          pos: [-20,12]
          size: 7
          aff: 2
          neighbors: [1]
        }
      ]

  @load: (gamestate,map) ->
    for star in map.stars
      gamestate.stars.push(new Star(star.id,
                                    new Vector2f(star.pos[0], star.pos[1]),
                                    star.size,
                                    star.aff))
    for star1 in map.stars
      for star2 in map.stars
        for neighbor in star1.neighbors
          if neighbor == star2.id
            console.log(@getStar(star1.id,map.stars))
            @getStar(star1.id,gamestate.stars).addNeighbor(@getStar(star2.id,gamestate.stars))
    true

  @getStar: (id, collection) ->
    for star in collection
      if(star.id == id)
        return star



