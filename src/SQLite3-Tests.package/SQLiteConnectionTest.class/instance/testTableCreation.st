testing
testTableCreation
	|sql|
	db open.	
	sql := 'CREATE TABLE ABC (ID INTEGER PRIMARY KEY, Name TEXT)'.
	db executeQuery: sql.
	db withResultForQuery: 'select * from sqlite_master;' do: [:each | 
		self assert: sql = (each nextRow at: 'sql')] 
	 