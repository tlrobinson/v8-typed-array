# Entire script is runable in browser but will rely on browser built-in types.
# Author: Jason Giedymin <jasong --at-- apache -_dot_- org>

# Faster Implementaiton
fastInvSqrt_typed = (n) ->
  # Based on my gist https://gist.github.com/1036533 without precision

  y = new Typed_Float32Array(1)
  i = new Typed_Int32Array(y.buffer)

  y[0] = n
  i[0] = 0x5f3759df - (i[0] >> 1)
    
  y[0] = y[0] * (1.5 - n * 0.5 * y[0] * y[0])

# Core implementation
mathInvSqrt = (n) ->
  return 1.0 / Math.sqrt(n)

# Browser? If not, then require
if !window?
  typed_array = require ('../build/default/typed-array')
  Typed_Float32Array = typed_array.Float32Array
  Typed_Int32Array = typed_array.Int32Array
  exports.fastInvSqrt_typed = fastInvSqrt_typed
  exports.mathInvSqrt = mathInvSqrt
else if window?
  Typed_Float32Array = Float32Array
  Typed_Int32Array = Int32Array
  console.log("Fast Inv Square Root of 100 is #{fastInvSqrt_typed(100)}")