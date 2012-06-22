class Star extends Entity
  constructor: (position, size, affiliation) ->
    super()

    @position = position
    @size = size
    @filled = Math.random()

    @letter = "b"

    @color = new Color.randGrey(150,175)
    @setOwner(affiliation)

    @addComponent new RenderComponent (camera) =>
      pane = camera.pane

      size = @size * camera.scale
      dispPosition = camera.gameToScreen(@position)

      # The opaque ring
      pane.fillStyle= @color.darkened(0).setOpacity(0.3).toString()
      pane.fillCircle(dispPosition,size)

      # The big center circle
      pane.fillStyle = @color.toString()
      pane.fillCircle(dispPosition, size * @filled)

      # the outer ring
      # pane.strokeStyle = @color.toString()
      # pane.lineWidth = 3
      # pane.strokeCircle(dispPosition,size-8)


  update: (deltat) ->
    super(deltat)
    @color.average(@basecolor,0.02)

  setOwner: (team) ->
    @team = team

    switch team
      when 0
        @basecolor = Color.randGrey(150,175)
      when 1
        @basecolor = Color.randColor([100,200],[0,30],[0,30])
      when 2
        @basecolor = Color.randColor([0,75],[0,75],[100,255])
