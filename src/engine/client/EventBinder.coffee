bindEvent = (element, listener) ->
    for method of listener
      element[method] = listener[method]

