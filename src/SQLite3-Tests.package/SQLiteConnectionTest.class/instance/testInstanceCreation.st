testing
testInstanceCreation
 
	self 
		assert: db notNil;
		assert: db class = self defaultTestClass;
		deny: (self defaultTestClass registry includes: db).
	
