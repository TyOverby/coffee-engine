class Engine
  constructor: ->
    @gamestate = {}
    @loaded = false

  load: ->
    @loaded = true
  update:(deltaT) ->
    throw "update() not yet implemented"

  loop: ->
    console.log "looping from Engine"
    @update()
    window.requestAnimationFrame((time)=> this.loop())

  play: ->
    if not @loaded
      @load()

    @loop()
