//%attributes = {}
#DECLARE($mails : Collection)
// Callback called after the email download

// save the mail list in the form
Form:C1466.mails:=$mails

// Hides the spinner
OBJECT SET VISIBLE:C603(*; "Spinner"; False:C215)
