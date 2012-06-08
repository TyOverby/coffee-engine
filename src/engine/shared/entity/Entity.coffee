class Entity
  constructor: ->
    @components = []

  addComponent: (component)->
    @components.push component
    component.setParent this

  getComponent: (componentType)->
    for component in @components
      if component instanceof componentType
        return component

  update: (deltat)->
    for component in @components
      component.update?(deltat)
    true

  render: (camera) ->
    for component in @components
      component.render?(camera)
    true


