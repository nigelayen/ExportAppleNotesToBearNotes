-- Ask for destination folder
set destinationFolder to (choose folder with prompt "Choose a folder to export your notes as HTML files:")
set destinationPOSIXPath to POSIX path of destinationFolder

-- Activate Notes app
tell application "Notes" to activate
delay 2

-- Get all notes from the default account
tell application "Notes"
	set allNotes to every note of default account
end tell

-- Loop over all notes
repeat with i from 1 to count of allNotes
	tell application "Notes"
		set thisNote to item i of allNotes
		set noteName to name of thisNote
		set noteHTML to body of thisNote -- Already in HTML format
	end tell

	-- Sanitize filename
	set cleanName to my sanitizeFileName(noteName)
	set finalPOSIXPath to destinationPOSIXPath & cleanName & ".html"

	-- Save HTML directly to file
	my saveTextToFile(noteHTML, finalPOSIXPath)
end repeat

-- Save text to file
on saveTextToFile(theText, thePOSIXPath)
	set theFile to POSIX file thePOSIXPath
	try
		set fileDescriptor to open for access theFile with write permission
		set eof of fileDescriptor to 0
		write theText to fileDescriptor as «class utf8»
		close access fileDescriptor
	on error errMsg number errNum
		try
			close access theFile
		end try
		display dialog "Error writing file: " & errMsg buttons {"OK"} default button 1
	end try
end saveTextToFile

-- Sanitize filenames
on sanitizeFileName(fileName)
	set illegalCharacters to {"/", ":", "*", "?", "\"", "<", ">", "|"}
	repeat with ch in illegalCharacters
		set fileName to my replaceText(ch, "-", fileName)
	end repeat
	return fileName
end sanitizeFileName

-- Replace text
on replaceText(find, replace, theText)
	set AppleScript's text item delimiters to find
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to replace
	set theText to theTextItems as string
	set AppleScript's text item delimiters to ""
	return theText
end replaceText
