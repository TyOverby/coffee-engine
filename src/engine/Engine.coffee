class global.Engine
  constructor: ->
    @gamestate = {}
    @loaded = false

  load: ->
    @loaded = true
  update:(deltaT) ->
    throw "update() not yet implemented"

  loop: ->
    console.log "looping from Engine"
    this.update()
    global.requestAnimationFrame((time)=> this.loop())

  play: ->
    if not @loaded
      this.load()

    this.loop()
