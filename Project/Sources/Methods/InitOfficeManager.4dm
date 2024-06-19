//%attributes = {}
// Init webserver 
var $webServer : 4D:C1709.WebServer


// Start the web server if necessary
$webServer:=WEB Server:C1674(Web server host database:K73:31)
If (Not:C34($webserver.isRunning))
	$webserver.start()
End if 

Form:C1466.OfficeAsync:=cs:C1710.OfficeAsyncManager.new()
Form:C1466.OfficeAsync.getToken()

Form:C1466.listManager:={}
Form:C1466.listManager.listRef:=New list:C375
Form:C1466.mails:=[]

ShowBoxInfo(False:C215)