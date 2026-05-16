# Export AppleNotes To Bear Notes

The usecase for this script is to export saved Apple Notes over to [Bear Notes](https://bear.app). Ideally, the notes should retain formatting
after import. Fortunately, Apple Notes stores its notes as html and AppleScript is able extract the content as html "body". So, all I need to do is grab the html content for each note, sanitize the title to be used as a filename, and write the file straight to .html. 

There is an app in the Apple App Store called "[Export](https://apps.apple.com/us/app/exporter/id1099120373?ls=1&mt=12)" that seems to do a great job and may be a better option for those that rather not fiddle with AppleScript.

Easy to edit after import to fix minor issues with Bear Notes not interpreting all of the html tags but the bulk of the text is converted.

## Usage
- Save the file "*ExportAppleNotesToHTML.scpt*" to a local folder on your computer. 
- Open Terminal app
- Change to the folder where the script is saved.
- Run the command:
```
osascript ExportAppleNotesToHTML.scpt
```
