
If (FORM Event:C1606.code=On Selection Change:K2:29)
	
	ShowBody(Form:C1466.mail)
	
	// Creation of the attachments list
	CALL WORKER:C1389("myWorker"; Formula:C1597(ShowAttachments); Form:C1466.mail; Current form window:C827)
	
End if 