running
tearDown
	db close.
	FileDirectory default deleteFileNamed: self databaseFileName.
	super tearDown