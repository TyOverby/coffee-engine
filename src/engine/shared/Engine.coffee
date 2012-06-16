class Engine
  constructor: ->
    @gamestate = {}
    @_loaded = false
    @_running = false

  load: ->
    @_loaded = true

  update:(deltaT) ->
    throw "update() not yet implemented"

  loop: ->
    @_prevTime ?= new Date().getTime()
    if @_running
      curTime = new Date().getTime()
      deltat = curTime-@_prevTime
      if deltat is 0
        deltat = 1

      @update(deltat)
      @_prevTime = curTime
      window.requestAnimationFrame((time)=> this.loop())

  play: ->
    if not @_running
      @_running = true
      if not @_loaded
        @load()

      @loop()

  stop: ->
    @_running = false
    @_prevTime = null
