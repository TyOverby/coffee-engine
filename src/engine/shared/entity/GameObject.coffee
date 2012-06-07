class root.GameObject
  components = []

  addComponent: (component)->
    components.push component
    component.setParent this

  getComponent: (componentType)->
    for component in components
      if component instanceof componentType
        return component

  update: (deltat)->
    for component in components
      component.update deltat
    true

  render: ->
    for component in components
      if render in component
        do component.render
    true


