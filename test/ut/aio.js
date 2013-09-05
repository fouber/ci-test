var ci = require('../../index.js');
var expect = require('chai').expect;

describe('general',function(){
    it('equal', function(){
        expect(ci.a).to.equal(123);
    });
    it('deep equal', function(){
        expect(ci._.filter( [1, 2, 3, 4, 5, 6], function(num){ return num % 2 == 0; } )).to.deep.equal([2, 4, 6 , 5]);
    });
});