class Camera
  constructor: (canvasId,centerPos)->
    @pane = new Pane canvasId
    @pos = centerPos
    @scale = 10

  # Returns the width of the view-port
  getWidth: ->
    @pane.canvas.width

  # Returns the height of the view-port
  getHeight: ->
    @pane.canvas.height

  inBounds: (position, radius) ->
    left  = position.x - @pos.x + radius > 0
    right = position.x + @pos.x - radius < @getWidth()

    top = position.y - @pos.x + radius > 0
    bot = position.y + @pos.y - radius < @getHeight()

    left && right && top && bot

  gameToScreen: (entityPos) ->
    entityPos.minus(@pos).scale(@scale)

  screenToGame: (screenPos) ->
    screenPos.scale(1/@scale).plus(@pos)

  move: (amount) ->
    @pos.plusEquals amount

  _half: ->
      new Vector2f @getWidth()  / 2,
                   @getHeight() / 2

  getCenter: ->
    @screenToGame(@_half())

  setCenter: (value) ->
    @pos = value
    @pos.minusEquals(@_half().scaled(1/@scale))
