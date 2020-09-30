# gsd
Bash script that assists with note-taking in markdown  
Uses pandoc to compile markdown files into PDFs  

# Commands
### mkall
m(a)keall: generate a pdf of any markdown files in workingdir  
USAGE: mkall  

### mkone
m(a)keone: generate a pdf of one markdown file  
USAGE: mkone [desired .md filename]  

### sonew
so(urce)new: generates new markdown file based on template format  
templates contain a few lines of text. Assumed to be located in ~/gsd/templates/  
USAGE: sonew [desired .md filename] [template file name]

### newtemp
newtemp(late): make and open new template under ~/gsd/templates/  
USAGE: newtemp(late) [desired template name]  

### listtemps
listtemp(late)s: lists all templates in template directory  
USAGE: listtemps 

# Installation
1. cd ~
2. git clone https://github.com/ThomasGeorgeBenoit/gsd
3. mkdir ~/gsd/templates/
4. source ~/gsd/gsd.sh


# Dependencies
pandoc (also dependent on LateX)
