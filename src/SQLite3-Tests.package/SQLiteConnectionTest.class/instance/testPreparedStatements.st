testing
testPreparedStatements

	| result record |
	(db execute: 'select * from sqlite_master' args: {}) ifEmpty:[
		db execute: 'create table employee (id INTEGER PRIMARY KEY, name TEXT, created DATE)'
			args: {}.
	].
	db execute: 'insert into employee values (?, ?, ?)' 
		args: {1. 'Adam'. DateAndTime now}.
	db execute: 'insert into employee values (?, ?, ?)' 
		args: {2. 'Eve'. nil}.
	result := db execute: 'select * from employee where name = ?' args: {'Adam'}.
	self assert: result size = 1.
	record := result first.
	self assert: (record at: #id) = 1.
	self assert: (record at: #name) = 'Adam'.
	result := db execute: 'select * from employee where name = ?' args: {'Eve'}.
	self assert: result size = 1.
	record := result first.
	self assert: (record at: #id) = 2.
	self assert: (record at: #name) = 'Eve'.
	self assert: (record at: #created) = nil.
