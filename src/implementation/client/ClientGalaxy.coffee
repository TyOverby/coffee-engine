class ClientGalaxy extends Galaxy
  load: ->
    super()
    @camera = new Camera "canvas", {x:0,y:0}

  update: ->
    super()
    do @render

  render: ->
    do @camera.clear

    @camera.pane.fill "#e7ebf2"

    @camera.pane.fillStyle = "red"
    for star in @stars
      star.render @camera
    true
