Class constructor($OAuth2Provider : cs:C1710.NetKit.OAuth2Provider)
	// Creation of the list of folder for Office
	
	This:C1470.OAuth2Provider:=$OAuth2Provider
	This:C1470.count:=0
	
	// Gets the folder list from Office and transforms it to an object usable by ListManager class
Function createList($parentFolderId : Text; $currentLvl : Object) : Object
	var $ref : Integer
	var $mailCount : Text
	var $folder; $param; $page : Object
	
	var $listRef:=New list:C375
	
	$param:=New object:C1471
	$param.top:=100
	
	If ($parentFolderId="")
		// Gets the folder collection directly under the root folder.
		$page:=cs:C1710.NetKit.Office365.new(This:C1470.OAuth2Provider).mail.getFolderList($param)
		$currentLvl:={}
	Else 
		// Gets folder for children of the $parentFolderId folder 
		$param.folderId:=$parentFolderId
		$page:=cs:C1710.NetKit.Office365.new(This:C1470.OAuth2Provider).mail.getFolderList($param)
	End if 
	
	Repeat 
		
		// loop on all the folders
		For each ($folder; $page.folders)
			
			// test if it is necessary to create a new hierarchy
			If ($folder.childFolderCount>0)
				This:C1470.count+=1
				// adds the new children to the list
				$currentLvl[$folder.displayName]:=cs:C1710.ListItem.new(This:C1470.count; $folder.id; $folder)
				This:C1470.createList($folder.id; $currentLvl[$folder.displayName])
			Else   // add to the current hierarchy
				This:C1470.count+=1
				// adds the new children to the list
				$currentLvl[$folder.displayName]:=cs:C1710.ListItem.new(This:C1470.count; $folder.id; $folder)
			End if 
			
		End for each 
		
	Until (Not:C34($page.next()))
	return $currentLvl