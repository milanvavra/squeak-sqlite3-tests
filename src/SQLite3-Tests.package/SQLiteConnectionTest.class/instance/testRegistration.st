testing
testRegistration

	db open.
	
	self assert: (self defaultTestClass registry includes: db).	
	
	db close.
	
	self deny: (self defaultTestClass registry includes: db).	