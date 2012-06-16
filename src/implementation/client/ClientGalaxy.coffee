class ClientGalaxy extends Galaxy
  load: ->
    super()
    @camera = new Camera "canvas", new Vector2f(0,0)
    bindEvent(@camera.pane.canvas,new EventListener(@camera))

  update: (deltat) ->
    super(deltat)
    @fps = Math.floor((1/deltat)*1000)
    @render()

  render: ->
    pane = @camera.pane

    # Paint the whole screen blue
    pane.clear "#e7ebf2"

    # Start drawing the lines
    pane.strokeStyle = "#c4cde0"
    pane.lineWidth = 1
    for x in [0.5 ... @camera.getWidth()] by 10
      pane.strokeLine {x:x,y:0}, {x: x, y: @camera.getHeight()}
    for y in [0.5 ... @camera.getHeight()] by 10
      pane.strokeLine {x: 0, y: y}, {x: @camera.getWidth(), y: y}


    for star in @gamestate.stars
      star.render @camera
    true

    pane.font = "30pt helvetica"
    pane.fillStyle = "black"
    pane.strokeStyle = "rgba(255,255,255,0.5)"

    pane.strokeText("fps: "+@fps, 0, 30)
    pane.fillText("fps: "+@fps, 0, 30)
