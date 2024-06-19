//%attributes = {}
#DECLARE($list : Object)
// Callback called after the creation of the hierarchical list of labels
// $list -> List reference

// Set the item list of the hierarchical list in the main process
Form:C1466.listManager:=$list

// Hide the spinner
OBJECT SET VISIBLE:C603(*; "Spinner1"; False:C215)