# Benchmark code borrowed from CoffeeKup Testss
# Author: Jason Giedymin <jasong --at-- apache -_dot_- org>

puts = console.log
float32 = require '../tests/float32'

benchmark = (title, code) -> 
  start = new Date
  for i in [1..10000]
    code()
  puts "#{title}: #{new Date - start} ms"

@run = ->
  console.log "-------------------------Benchmarks----------------------------"
  console.log "Speed depends on the system CPU."
  console.log "For some the Core implementation is quicker."
  console.log "Yet for others the fast inverse square is instead quicker."
  console.log "-------------------------Results-------------------------------"
  console.log "10,000 Iterations of calculating the Inverse Square of 100"
  benchmark 'Core Inv Square root', -> float32.mathInvSqrt(100)
  benchmark 'Fast Inv Square root', -> float32.fastInvSqrt_typed(100)