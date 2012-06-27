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
    #pane.clear "#e7ebf2"
    pane.clear "black"

    # Start drawing the lines
    #pane.strokeStyle = "#c4cde0"
    pane.strokeStyle = "rgba(50,50,50,0.5)"
    pane.lineWidth = 1

    startPos = @camera.pos.scaled(@camera.scale)

    for x in [-startPos.x % @camera.scale ... @camera.getWidth()] by @camera.scale
      x = Math.floor(x) + 0.5
      pane.strokeLine {x:x,y:0}, {x: x, y: @camera.getHeight()}

    for y in [-startPos.y % @camera.scale ... @camera.getHeight()] by @camera.scale
      y = Math.floor(y) + 0.5
      pane.strokeLine {x: 0, y: y}, {x: @camera.getWidth(), y: y}


    for star in @gamestate.stars
      star.render @camera

    pane.font = "30pt helvetica"
    pane.fillStyle = "white"
    pane.strokeStyle = "rgba(255,255,255,0.75)"

    pane.lineWidth = 0
    #pane.strokeText("fps: "+@fps, 0, 30)
    pane.fillText("fps: "+@fps, 0, 30)
