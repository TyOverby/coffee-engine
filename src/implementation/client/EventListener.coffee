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
    console.log "~~~~~"
    console.log(@getOffset(e).toString())
    console.log(@camera.screenToGame(@getOffset(e)).toString())

  onmouseup: (e) ->
    @_btns_down[e.which] = false
    @oldPos = null
    @prevent e

  onmousemove: (e) ->
    curOffset = @getOffset(e)
    if @_btns_down[RIGHT_BUTTON]
      pos = @getOffset(e)

      if @oldPos?
        @camera.pos.plusEquals(@oldPos.minus(pos).scaled(1/@camera.scale))
      @oldPos = pos

  onmousewheel: (e) ->
    oldCenter = @camera.getCenter()

    delta = e.wheelDelta / (60)
    delta /= 1.9
    absDelta = Math.abs(delta)

    if delta > 0
      @camera.scale *= 1.2
    else
      @camera.scale /= 1.2

    @camera.setCenter(oldCenter)
    @prevent(e)


  oncontextmenu: (e)->
    false

  getOffset: (e) ->
    if e.offsetX && e.offsetY
      x = e.offsetX
      y = e.offsetY
    else
      x = e.pageX - @camera.pane.canvas.offsetLeft
      y = e.pageY - @camera.pane.canvas.offsetTop
    return new Vector2f x, y

  prevent: (e) ->
    e.preventDefault()
