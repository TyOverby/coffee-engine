root = exports ? this

root.requestAnimationFrame ||=
  root.webkitRequestAnimationFrame ||
  root.mozRequestAnimationFrame    ||
  root.oRequestAnimationFrame      ||
  root.msRequestAnimationFrame     ||
  (callback, element) ->
    setTimeout( ->
      callback(+new Date()) 1000 / 60)
