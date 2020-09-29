#! /bin/bash

# m(a)keall: generate a pdf of any markdown files in workingdir 
# USAGE: mkall
function mkall(){
    printf "Compiling"
	for name in $PWD/*.md; do
		[ -f "$name" ] || break
		basename="${name%.*}"
		pandoc -V geometry:margin=1in -o $basename.pdf $name
        printf " "${basename##*/}.pdf
	done
    printf "\n"
}

# m(a)keone: generate a pdf of one markdown file
# USAGE: mkone [desired .md filename]
function mkone(){
    if [ $# -eq 0 ]; then echo "USAGE: mkone [filename]"; return; fi
    
    basename="${1%.*}"
    echo compiling $basename.pdf
	pandoc -V geometry:margin=1in -o $basename.pdf $name
}

# so(urce)new: generates new markdown file based on template format
# USAGE: sonew [desired .md filename] [template file name]
# templates contain a few lines of text. Located in ~/.gsd/templates/
function sonew(){
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

# newtemp(late): make and open new template under ~/.gsd/templates/
# USAGE: newtemp(late) [desired template name] 
function newtemp() {
    #argument and input checking
    if [ $# -eq 0 ]; then echo "USAGE: newtemp [desired template name]"; return; fi
    if [ -f "$PWD/$1" ]; then echo "$1 already exists."; return; fi
    
    newtemp=/Users/$USER/.gsd/templates/$1
    if [[ "$1" == *".md" ]]; then
        nvim "$newtemp"
    else
        nvim "$newtemp.md"
    fi
}

# listtem(late)s: lists all templates in template directory
# USAGE: listtemps
function listtemps(){
    printf "Available Templates:"
	for name in "/Users/$USER/.gsd/templates"/*; do
        printf " "${name##*/}
	done
    printf "\n" 
}
