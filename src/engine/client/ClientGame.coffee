class Client extends Game

  # Prepare the camera, init game state
  load: ->
    super()

  # Make updates to the state of the game
  update: ->
    super()
    this.render()

  render: ->
    # do rendering here
    throw "render() from Client is not yet implemented"
