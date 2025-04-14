# Export AppleNotes To Bear Notes

## What is the use case for this script?
I have 100's of Apple Notes that I would like to export over to [Bear Notes](https://bear.app). Ideally, I would like to my notes to retain formatting
after import. Fortunately, Apple Notes stores its notes as html and AppleScript is able extract the content as html "body". So, in theory, all I need to do grab the html content for each note, sanitize the note title to be used as a filename, and write the file straight to .html. There is an app in the Apple App Store called "[Export](https://apps.apple.com/us/app/exporter/id1099120373?ls=1&mt=12)" that seems to do a great job and may be a better option for those that rather not fiddle with AppleScript.

Occasionally I do have to edit after import to fix a few minor issues line Bear Notes not interpreting all html tags but I do have the bulk of the 
text I need for each note, which can be easily imported into Bear Notes.

## Usage
- Save the file ExportAppleNotesToHTML.scpt to a local folder on your computer. 
- Open Terminal app
- Change to the folder where the script is saved.
>% osascript ExportAppleNotesToHTML.scpt
