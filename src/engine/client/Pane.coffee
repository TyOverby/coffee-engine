Pane = (id) ->
  document.getElementById(id).getContext("2d")

CanvasRenderingContext2D::fillCircle = (position,radius) ->
  this.beginPath()
  this.arc(position.x, position.y, radius, 0, Math.PI * 2, true)
  this.fill()
  this.closePath()

CanvasRenderingContext2D::strokeCircle = (position,radius) ->
  this.beginPath()
  this.arc(position.x, position.y, radius, 0, Math.PI * 2, true)
  this.stroke()
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

CanvasRenderingContext2D::clear = (color) ->
  @fillStyle = color
  @fillRect 0, 0, @.canvas.width, @.canvas.height

CanvasRenderingContext2D::drawDot = (position) ->
  this.fillCircle(position, 5)

CanvasRenderingContext2D::fillWedge = (center, radius, distance, degree, p1, p2, footP) ->
  this.beginPath()
  this.arc(center.x, center.y, radius + distance, degree, degree+Math.PI, true)
  this.lineTo(p1.x, p1.y)
  this.lineTo(p2.x, p2.y)
  this.lineTo(footP.x, footP.y)
  this.closePath()




