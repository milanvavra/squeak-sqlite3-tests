testing
testPreparedStatements

	(db execute: 'select * from sqlite_master' args: {}) ifEmpty:[
		db execute: 'create table employee (id INTEGER PRIMARY KEY, name TEXT, created DATE)'
			args: {}.
	].
	db execute: 'insert into employee values (?, ?, ?)' 
		args: {1. 'Adam'. DateAndTime now}.
	db execute: 'insert into employee values (?, ?, ?)' 
		args: {2. 'Eve'. nil}.
	db execute: 'select id, name from employee where name = ?' args: {'Adam'} do:[:id :name|
		self assert: id = 1.
		self assert: name = 'Adam'.
	].

	db execute: 'select * from employee where name = ?' args: {'Eve'} do:[:id :name :created|
		self assert: id = 2.
		self assert: name = 'Eve'.
		self assert: created = nil.
	].
