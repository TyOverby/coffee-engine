# Add more to this as you need more
class Vector2f
  constructor:(x,y)->
    @x = x
    @y = y
    this

  clone: ->
    new Vector2f @x, @y

  equals:(other) ->
    @x==other.x && @y ==other.y

  toString: ->
    "(" + @x + ", " + @y + ")"

  plus: (other)->
    new Vector2f @x+other.x, @y+other.y

  plusEquals: (other)->
    @x += other.x
    @y += other.y
    this

  minus: (other)->
    new Vector2f @x-other.x, @y-other.y

  minusEquals: (other)->
    @x -= other.x
    @y -= other.y
    this

  scale: (scalar)->
    @x *= scalar
    @y *= scalar
    this

  scaled: (scalar)->
    new Vector2f @x*scalar, @y*scalar

  normalize:  ->
    len = @magnitude()
    @x /= len
    @y /= len
    this

  normalized: ->
    len = @magnitude()
    new Vector2f @x / len, @y / len

  invert: ->
    @x = -@x
    @y = -@y
    this

  inverted: ->
    new Vector2f -@x, -@y

  corner: ->
    oldX = @x
    @x = @y
    @y = -oldX
    this

  cornered: ->
    new Vector2f(@y, -@x)

  magnitudeSquared: ->
    @x*@x + @y*@y

  getTheta: ->
    theta = Math.atan2(@y, @x)
    if (theta < Math.PI*-2) || (theta > Math.PI*2)
      theta = theta % 360
    if theta < 0
      theta += Math.PI*2
    theta

  setMagnitude: (newMag) ->
    @normalize()
    @scale(newMag)

  magnitude: ->
    Math.sqrt @magnitudeSquared()

  dot:(other) ->
    @x*other.x + @y*other.y
