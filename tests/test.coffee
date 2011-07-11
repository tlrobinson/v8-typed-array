# Test code borrowed from CoffeeKup Testss
# Author: Jason Giedymin <jasong --at-- apache -_dot_- org>

@run = ->
  test "Core Implementation Math.sqrt 100", ->
    float32.mathInvSqrt(100) is 0.1

  test "Core Implementation Math.sqrt 200", ->
    float32.mathInvSqrt(200) is 0.07071067811865475
  
  test "Core Implementation Math.sqrt 1000", ->
    float32.mathInvSqrt(1000) is 0.03162277660168379

  test "FastInvSqrt Implementation Float32Array 100", ->
    float32.fastInvSqrt_typed(100) is 0.0998448825932014
  
  test "FastInvSqrt Float32Array 200", ->
    float32.fastInvSqrt_typed(200) is 0.07067797178916854
  
  test "FastInvSqrt Float32Array 1000", ->
    float32.fastInvSqrt_typed(1000) is 0.03156984300762538

puts = console.log
print = require('sys').print
float32 = require './float32'

[tests, passed, failed, errors] = [ [], [], [], [] ]

test = (name, code) ->
  tests.push name
  print "Testing \"#{name}\"... "
  try
    if code()
      passed.push name
      puts "[OK]"
    else
      failed.push name
      puts "[Failed]"
  catch ex
    errors.push name
    puts "[Error] \"#{ex.message}\""
