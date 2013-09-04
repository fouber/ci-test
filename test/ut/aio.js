var ci = require('ci-test');

describe('one',function(){
    it('start', function(){
        expect(ci.a).to.equal(123);
    });
});