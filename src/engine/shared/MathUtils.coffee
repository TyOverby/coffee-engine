Math::randDouble = (limit1, limit2)->
  switch arguments.length
    when 1
      randDouble(0,limit1)
    when 2
      Math.random(limit2-limit1)+limit1

Math::randInt = (limit1,limit2)->
  switch arguments.length
    when 1
      randInt(0,limit1)
    when 2
      Math.floor Math.randDouble(limit1,limit2)

Math::decision = (factor)->
  math.random()<=factor
