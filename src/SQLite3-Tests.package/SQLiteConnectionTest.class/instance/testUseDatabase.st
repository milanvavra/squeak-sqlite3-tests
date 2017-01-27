testing
testUseDatabase
	|s1 s2 s3 arrayOfDicts|
	s1 := 'create table employee (id, name)'.
	s2 := 'insert into employee values (1, ''Adam'')'.
	s3 := 'insert into employee values (2, ''Eve'')'.
	(Array with: s1 with: s2 with: s3)
		do: [:sql | db  executeQuery: sql].
	
	arrayOfDicts := db executeQuery: 'SELECT * FROM employee'.
	self assert: arrayOfDicts size = 2.
	self assert: (arrayOfDicts first at: 'name') = 'Adam'
	