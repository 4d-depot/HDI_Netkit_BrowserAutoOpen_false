//%attributes = {}
// Start receiving of the mail list according to the number of mail defined by Form.numberMails
var $listID : Integer
var $param : Object

ARRAY LONGINT:C221($arr; 0)

If (Is a list:C621(Form:C1466.listManager.listRef))
	$listID:=Selected list items:C379(Form:C1466.listManager.listRef; $arr; *)
	
	// Search the folder information of the selected folder
	Form:C1466.currentFolder:=Form:C1466.listManager.search($listID)
	
	If (Form:C1466.currentFolder#Null:C1517)
		// Reset the mail list
		Form:C1466.mails:=New collection:C1472
		
		// Reset the body
		Form:C1466.textBody:=""
		WA SET PAGE CONTENT:C1037(*; "web area"; "<html></html>"; "file:///")
		
		OBJECT SET VISIBLE:C603(*; "Spinner"; True:C214)
		
		// getMails paramters
		$param:=New object:C1471()
		// folder containing the emails
		$param.folderId:=Form:C1466.currentFolder.id
		// Number emails returned by the server
		$param.top:=Form:C1466.numberMails
		// Attributs of the emails returned by the server
		$param.select:="subject,from,ccRecipients,toRecipients,receivedDateTime,body,sentDateTime,hasAttachments"
		
		// Start the downoad of the emails
		Form:C1466.OfficeAsync.getMails($param; Formula:C1597(OnMailListcreated($1)))
	End if 
End if 