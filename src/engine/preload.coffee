root = exports ? this

window.requestAnimationFrame ||=
  webkitRequestAnimationFrame ||
  mozRequestAnimationFrame    ||
  oRequestAnimationFrame      ||
  msRequestAnimationFrame     ||
  (callback, element) ->
    setTimeout( ->
      callback(+new Date()) 1000 / 60)
