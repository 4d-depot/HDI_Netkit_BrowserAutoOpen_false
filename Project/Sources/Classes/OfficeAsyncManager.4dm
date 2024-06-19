Class constructor
	
	This:C1470.name:="OfficeWorker"
	
	CALL WORKER:C1389(This:C1470.name; Formula:C1597(Provider:=cs:C1710.OfficeProvider.new($1)); Current form window:C827)
	
Function getToken()
	
	CALL WORKER:C1389(This:C1470.name; Formula:C1597(Provider.getToken()))
	
Function getFolders()
	
	CALL WORKER:C1389(This:C1470.name; Formula:C1597(Provider.getFolders()))
	
Function getMails($parameter : Object)
	
	CALL WORKER:C1389(This:C1470.name; Formula:C1597(Provider.getMails($parameter)))
	
Function kill()
	
	If (Process number:C372(This:C1470.name)>0)
		KILL WORKER:C1390(This:C1470.name)
	End if 
	
	