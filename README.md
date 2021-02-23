# NoteBat
Batch that creates markdown notes in a simple file structure ready to be used with git. 

Make sure to set your note directory in the file. 
The Batch file does th following.

* Creates a folder with the current year if it already doesn't exist
* Creates a folder with the current month if it already doesn't exist
* Create a new Markdown (.md) file with the following name: ```Note-YYYY-MM-DD_HMS.md```
   *  Multiple notes per day can be created. Each file is timestamped with HMS to avoid collisions.
* Opens notepad or change to your editor of choice. (Notepad will prompt you with a message asking if you would like to create the non-existing file.)

The final file structure will look something like this:
```
📦RootNoteDirectory
 ┣ 📂2020
 ┃ ┗ 📂12-DECEMBER
 ┃    ┗ 📜Note-2020-12-30_131039.md
 ┃    ┗ 📜Note-2020-12-31_100708.md
 ┃    ┗ 📜Note-2020-12-31_104915.md
 ┃    ┗ 📜Summary.md
 ┣ 📂2021
 ┃ ┗ 📂01-JANUARY
 ┃    ┗ 📜Note-2021-01-04_080252.md
 ┃    ┗ 📜Note-2021-01-29_114401.md
 ┃    ┗ 📜Summary.md
 ┃ ┗ 📂02-FEBRUARY
 ┃    ┗ 📜Note-2021-02-02_081041.md
 ┃    ┗ 📜Note-2021-02-04_104725.md
 ┃    ┗ 📜Note-2021-02-05_112507.md
 ┃    ┗ 📜Note-2021-02-18_085300.md
```
* At the start of each new month it will create a summary file of the pervious month. The summary file combines all the notes from the previous month into a summary.md file. This make is a little easier if you are searching for something. Both the original day based and summary notes will live together. 
