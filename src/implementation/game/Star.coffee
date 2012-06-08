class Star extends Entity
  constructor: (position, size) ->
    super()

    @position = position
    @size = size

    @addComponent new RenderComponent (camera) =>
      console.log "rendering from star: "+ @size
      camera.pane.fillRect(
        @position.x,
        @position.y,
        @size,
        @size,)

