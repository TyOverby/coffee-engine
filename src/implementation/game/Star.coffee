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
      pane.fillStyle= @color.darkened(0).setOpacity(0.3).toString()
      pane.fillCircle(dispPosition,size)

      # The big center circle
      pane.fillStyle = @color.toString()
      pane.fillCircle(dispPosition, size * @filled)

      # vector towards the neighbors
      for neighbor in @neighbors
        getFeet = (center, towards, size)->
          foot1 = towards.cornered().setMagnitude(size)
          foot2 = foot1.inverted()

          center.

        towardsNeighbor = neighbor.position.minus(this.position)
        pane.strokeStyle = "green"
        dispNeighbor = camera.gameToScreen(neighbor.position)

        foot1 = towardsNeighbor.cornered().normalize().scale(size)
        foot2 = foot1.inverted()

        dist = dispNeighbor.minus(dispPosition).magnitude()
        nextCenterV = towardsNeighbor.clone().setMagnitude(dist/3)
        nextCenter = dispPosition.plus(nextCenterV)
        nextTowards = nextCenterV.clone()

        nFoot1 = nextTowards.cornered().normalize().scale(neighbor.size * camera.scale)
        nFoot2 = nFoot1.inverted()

        nPos1 = dispPosition.plus(nFoot1)
        nPos2 = dispPosition.plus(nFoot2)
        #pane.strokeStyle = "green"
        #pane.strokeVector(dispPosition,nextCenter)
        #pane.strokeVector(dispPosition, foot1)
        #pane.strokeVector(dispPosition, foot2)

        #pos1 = dispPosition.plus(foot1)
        #pos2 = dispPosition.plus(foot2)

        pane.drawDot(nPos1)
        pane.drawDot(nPos2)

        pane.strokeStyle = "red"
        pane.fillWedge(dispPosition, dispNeighbor, size, 10, foot2.getTheta(), foot2.getTheta(),0)


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
