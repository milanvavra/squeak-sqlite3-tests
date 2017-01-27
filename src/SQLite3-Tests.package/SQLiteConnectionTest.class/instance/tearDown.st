running
tearDown
	db close.
	FileDirectory default deleteFileNamed: self databaseName.
	super tearDown