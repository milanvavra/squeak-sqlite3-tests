running
databaseFileName
	"Macs (tested OS X 6.2) require absolute file paths to the database, Windows and Ubuntu do not"
	
	^ FileDirectory default fullNameFor: self databaseName.