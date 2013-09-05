var ci = require('../../index.js');
var assert = require('assert');

console.log('start');

assert.equal(ci.a, 123, 'ci-test.a');
console.log('case 1');

assert.equal(
    ci._.filter(
        [1, 2, 3, 4, 5, 6],
        function(num){
            return num % 2 == 0;
        }
    ),
    [2, 4, 6],
    'ci-test._.filter'
);
console.log('case 2');

console.log('end');