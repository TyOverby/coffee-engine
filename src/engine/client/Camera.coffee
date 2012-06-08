class Camera
  constructor: (canvasId,centerPos)->
    @pane = new Pane canvasId
    @pos = centerPos

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

  getModPos: (enityPos) ->
    entityPos.minus(@pos)

  move: (amount) ->
    @pos.plusEquals amount

  _half: ->
      x: @getWidth()  / 2
      y: @getHeight() / 2

  setCenter: (value) ->
    @pos = value.minusEquals(_half())

  clear: ->
    @pane.clearRect 0, 0, @getWidth(), @getHeight()
