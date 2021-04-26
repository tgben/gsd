#! /bin/bash

# make: generate a pdf of all markdown files in working directory
# USAGE: gsdmake
function gsdmake(){
    printf "Compiling"
	for name in $PWD/*.md; do
		[ -f "$name" ] || break
		basename="${name%.*}"
		pandoc -V geometry:margin=1in -o $basename.pdf $name
        printf " "${basename##*/}.pdf
	done
    printf "\n"
}

# make one: generate a pdf of one markdown file
# USAGE: gsdmakeone [desired .md filename]
function gsdmakeone(){
    if [ $# -eq 0 ]; then echo "USAGE: mkone [filename]"; return; fi
    
    basename="${1%.*}"
    echo compiling $basename.pdf
	pandoc -V geometry:margin=1in -o $basename.pdf $name
}

# new: generates new markdown file based on template format
# USAGE: gsdnew [desired .md filename] [template file name]
# templates contain a few lines of text. Located in ~/.gsd/templates/
function gsdnew(){
    #argument and input checking
    if [ $# -eq 0 ]; then echo "USAGE: sonew [new name] [template]"; return; fi
    if [ -f "$PWD/$1" ]; then echo "$1 already exists."; return; fi
    if ! [ -f "/Users/$USER/.gsd/templates/$2" ]; then echo "$2 doesn't exist.";return; fi

    template=/Users/$USER/.gsd/templates/$2
    if [[ "$1" == *".md" ]]; then
        cat $template > "$PWD/$1"
    else
        cat $template > "$PWD/$1.md"
    fi
}

# new template: make and open new template under ~/.gsd/templates/
# USAGE: gsdnewtemplate(late) [desired template name] 
function gsdnewtemplate() {
    #argument and input checking
    if [ $# -eq 0 ]; then echo "USAGE: newtemp [desired template name]"; return; fi
    if [ -f "$PWD/$1" ]; then echo "$1 already exists."; return; fi
    
    newtemp=/Users/$USER/.gsd/templates/$1
    # really should open with neovim, but I guess vim must do.
    if [[ "$1" == *".md" ]]; then
        vim "$newtemp"
    else
        vim "$newtemp.md"
    fi
}

# list templates: lists all templates in template directory
# USAGE: gsdlisttemplates
function gsdlisttemplates(){
    printf "Available Templates:"
	for name in "/Users/$USER/.gsd/templates"/*; do
        printf " "${name##*/}
	done
    printf "\n" 
}
