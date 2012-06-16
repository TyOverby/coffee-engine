class Star extends Entity
  constructor: (position, size, affiliation) ->
    super()

    @position = position.scale(10)
    @size = size

    @letter = "b"

    @color = new Color.randGrey(150,175)
    @setOwner(affiliation)

    @addComponent new RenderComponent (camera) =>
      pane = camera.pane

      size = @size*10
      dispPosition = camera.getModPos(@position)

      # The big center circle
      pane.fillStyle = @color.toString()
      pane.fillCircle(dispPosition, size)

      # The opaque ring
      pane.strokeStyle = @color.darkened(0).setOpacity(0.5).toString()
      pane.lineWidth = 10
      pane.strokeCircle(dispPosition,size+5)

      # the outer ring
      pane.strokeStyle = @color.toString()
      pane.lineWidth = 3
      pane.strokeCircle(dispPosition,size+10)


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
