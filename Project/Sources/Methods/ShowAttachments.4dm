//%attributes = {}
#DECLARE($mail : Object; $winRef : Integer)
// Creation of the list of attachemnt name to display in the dropdown list
// Enable or disable the attachment dropdownlist and button
// $mail -> mail object selected in the listbox
// $winRef -> Ref of the caller worker 


var $attachments : Object
var $isEnabled : Boolean

$attachments:=New object:C1471
$attachments.values:=New collection:C1472
$attachments.index:=-1  //currentValue is a placeholder
$isEnabled:=False:C215

// Display the spinner
CALL FORM:C1391($winRef; Formula:C1597(OBJECT SET VISIBLE:C603(*; "Spinner2"; True:C214)))

$attachments:=New object:C1471
// If attachments associated to the email
If (Bool:C1537($mail.hasAttachments))
	
	// Creates the collection of attachment name to display in the dropdownlist
	$attachments.values:=$mail.attachments.map(Formula:C1597($1.result:=$1.value.name))
	$isEnabled:=True:C214
	
End if 
CALL FORM:C1391($winRef; Formula:C1597(Form:C1466.attachments:=$attachments))

// Enable the dropdown list if attachments present
CALL FORM:C1391($winRef; Formula:C1597(OBJECT SET ENABLED:C1123(*; "attachment_DropdownList"; $isEnabled)))
// Enable the download button if attachments present
CALL FORM:C1391($winRef; Formula:C1597(OBJECT SET ENABLED:C1123(*; "attachment_Button"; $isEnabled)))


// Hide the spinner
CALL FORM:C1391($winRef; Formula:C1597(OBJECT SET VISIBLE:C603(*; "Spinner2"; False:C215)))
