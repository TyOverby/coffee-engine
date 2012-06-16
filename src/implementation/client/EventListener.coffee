LEFT_BUTTON = 1
RIGHT_BUTTON = 3

class EventListener
  constructor: (camera) ->
    @camera = camera

    @_btns_down = []
    for i in [0..3]
      @_btns_down[i] = false

  onmousedown: (e) ->
    @_btns_down[e.which] = true
    @prevent e

  onmouseup: (e) ->
    @_btns_down[e.which] = false
    @oldPos = null
    @prevent e

  onmousemove: (e) ->
    if @_btns_down[RIGHT_BUTTON]
      curOffset = new Vector2f(e.offsetX, e.offsetY)

      pos = new Vector2f(e.offsetX, e.offsetY)

      if @oldPos?
        @camera.pos.plusEquals(@oldPos.minus(pos))
      @oldPos = pos

  oncontextmenu: (e)->
    false

  prevent: (e) ->
    console.log(@_btns_down)
    e.preventDefault()
