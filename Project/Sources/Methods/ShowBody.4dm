//%attributes = {}
#DECLARE($mail : Object)
// Display the body


If ($mail#Null:C1517)
	
	WA SET PAGE CONTENT:C1037(*; "web area"; $mail.body.content; "file:///")
	
End if 