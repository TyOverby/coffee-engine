class Color
  constructor: (r, g, b, a) ->
    @r = r
    @g = g
    @b = b
    @a = a?| 1

  clone: ->
    new Color @r, @g, @b, @a

  average: (other, factor) ->
    @r = @r + (other.r - @r) * factor
    @g = @g + (other.g - @g) * factor
    @b = @b + (other.b - @b) * factor
    @a = @a + (other.a - @a) * factor
    this

  averaged: (other, factor) ->
    this.clone().average(other,factor)

  darken: (amount) ->
    @r -= amount
    @g -= amount
    @b -= amount
    this

  darkened: (amount) ->
    this.clone().darken(amount)

  setOpacity: (opacity) ->
    this.a = opacity
    this

  toString: ->
    f = Math.floor
    "rgba("+f(@r)+","+f(@g)+","+f(@b)+","+@a+")"

  @randColor = (r, g, b, a) ->
    a ?= [255,255]
    base  = 50
    red   = Math.randInt(base + r[0], base + r[1])
    green = Math.randInt(base + g[0], base + g[1])
    blue  = Math.randInt(base + b[0], base + b[1])
    alpha = Math.randInt(base + a?[0], base + a[1])

    new Color(red,green,blue,alpha)
  @randGrey = (min,max) ->
    val = Math.randInt(min,max)
    new Color(val,val,val)



