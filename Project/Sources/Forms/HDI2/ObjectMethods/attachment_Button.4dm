
If ((Form:C1466.attachments.index#Null:C1517) && (Num:C11(Form:C1466.attachments.index)>=0))
	var $doc : Text
	var $content : Blob
	
	// Select the folder and file name
	$doc:=Select document:C905(Folder:C1567(fk documents folder:K87:21).file(Form:C1466.attachments.currentValue).platformPath; "*.*"; "Save attachment"; File name entry:K24:17)
	
	If (Bool:C1537(OK))
		// Returns the contents of the attachment object in a BLOB
		$content:=Form:C1466.mail.attachments[Form:C1466.attachments.index].getContent()
		
		// creation of the document
		BLOB TO DOCUMENT:C526(Document; $content)
		
	End if 
	
End if 