Pane = (id) ->
  document.getElementById(id).getContext("2d")

CanvasRenderingContext2D::fillCircle = (position,radius) ->
  this.beginPath()
  this.arc(position.x, position.y, radius, 0, Math.PI * 2, true)
  this.fill()
  this.closePath()

CanvasRenderingContext2D::strokeLine = (p1, p2) ->
  this.beginPath()
  this.moveTo(p1.x, p1.y)
  this.lineTo(p2.x, p2.y)
  this.closePath()
  this.stroke()

CanvasRenderingContext2D::strokeVector = (position, velocity) ->
  if not velocity?
    velocity = position
    position = new Vector2f 0, 0
  @strokeLine position, position.plus velocity

CanvasRenderingContext2D::fill = (color) ->
  @fillStyle = color
  @fillRect 0, 0, @.canvas.width, @.canvas.height
