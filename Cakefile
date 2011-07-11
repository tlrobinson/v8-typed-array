exec = require('child_process').exec

task 'build', ->
  exec 'node-waf configure build', (err) ->
    console.log err if err

task 'test', -> require('./tests/test.coffee').run()

task 'benchmark', -> require('./benchmarks/benchmark.coffee').run()
