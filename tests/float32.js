(function() {
  var Typed_Float32Array, Typed_Int32Array, fastInvSqrt_typed, mathInvSqrt, typed_array;
  fastInvSqrt_typed = function(n) {
    var i, y;
    y = new Typed_Float32Array(1);
    i = new Typed_Int32Array(y.buffer);
    y[0] = n;
    i[0] = 0x5f3759df - (i[0] >> 1);
    return y[0] = y[0] * (1.5 - n * 0.5 * y[0] * y[0]);
  };
  mathInvSqrt = function(n) {
    return 1.0 / Math.sqrt(n);
  };
  if (!(typeof window !== "undefined" && window !== null)) {
    typed_array = require('../build/default/typed-array');
    Typed_Float32Array = typed_array.Float32Array;
    Typed_Int32Array = typed_array.Int32Array;
    exports.fastInvSqrt_typed = fastInvSqrt_typed;
    exports.mathInvSqrt = mathInvSqrt;
  } else if (typeof window !== "undefined" && window !== null) {
    Typed_Float32Array = Float32Array;
    Typed_Int32Array = Int32Array;
    console.log("Fast Inv Square Root of 100 is " + (fastInvSqrt_typed(100)));
  }
}).call(this);
