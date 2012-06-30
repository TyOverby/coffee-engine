class Star extends Entity
  constructor: (id, position, size, affiliation) ->
    super()

    @id = id
    @position = position
    @size = size
    @filled = Math.random()
    @neighbors = []

    @color = new Color.randGrey(150,175)
    @setOwner(affiliation)

    @addComponent new RenderComponent (camera) =>
      pane = camera.pane

      size = @size * camera.scale
      dispPosition = camera.gameToScreen(@position)

      # The opaque ring
      pane.fillStyle= @color.clone().setOpacity(0.5).toString()
      pane.fillCircle(dispPosition,size)

      # The big center circle
      pane.fillStyle = @color.toString()
      pane.fillCircle(dispPosition, size * @filled)

      # vector towards the neighbors
      for neighbor in @neighbors
        neighborDispPosition = camera.gameToScreen(neighbor.position)
        getFeet = (center, towards, size)->
          foot1 = towards.cornered().setMagnitude(size)
          foot2 = foot1.inverted()
          return [center.plus(foot1), center.plus(foot2)]

        mainFeet = getFeet(@position, neighbor.position.minus(@position), @size)
        newPos = @position.plus(neighbor.position.minus(@position).scaled(4/8))
        halfFeet = getFeet(newPos, neighbor.position.minus(@position), (@size+neighbor.size)/2)

        #pane.drawDot(camera.gameToScreen(foot)) for foot in mainFeet
        #pane.drawDot(camera.gameToScreen(foot)) for foot in halfFeet

        pane.strokeStyle = "red"
        dist = camera.scale
        pane.fillWedge(dispPosition,
                        size,
                        dist,
                        mainFeet[1].minus(@position).getTheta(),
                        camera.gameToScreen(halfFeet[0]),
                        camera.gameToScreen(halfFeet[1]),
                        camera.gameToScreen(mainFeet[1].plus(mainFeet[1].minus(@position).setMagnitude(dist/camera.scale))))

        gradient = pane.createLinearGradient(dispPosition.x, dispPosition.y, neighborDispPosition.x, neighborDispPosition.y)
        gradient.addColorStop(0, @color.clone().setOpacity(0.3).toString())
        gradient.addColorStop(4/9, @color.averaged(neighbor.color,0.5).setOpacity(0.3).toString())
        pane.fillStyle = gradient
        pane.fill()

  addNeighbor: (star) ->
    @neighbors.push(star)

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
