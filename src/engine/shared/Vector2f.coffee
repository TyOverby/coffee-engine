# Add more to this as you need more
class Vector2f
  constructor:(x,y)->
    @x = x
    @y = y

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

  normalise: ->
    @x /=@magnitude()
    @y /=@magnitude()
    this

  normalised: ->
    new Vector2f @x/@magnitude(), @y/@magnitude()

  invert: ->
    @x = -@x
    @y = -@y
    this

  inverted: ->
    new Vector2f -@x, -@y

  magnitudeSquared: ->
    @x*@x + @y*@y

  magnitude: ->
    Math.sqrt @magnitudeSquared()


  dot:(other) ->
    @x*other.x + @y*other.y
