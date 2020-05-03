#!/usr/bin/env zsh

# Make executable with chmod +x <<filename.sh>>-----------------------------------------------------------------------------
# To run the file go to the directory where you downloaded the file and type ./git_automation.zsh $1 $2 $3 

# $1 is the project name
# $2 is the project description to write within quotes '' (if you do not want to give description leave empty quotes or take the argument out of the function ) line 24 and line 98
# $3 (last argument) is the destination repo ---- python / php / r / js / etc... ---- 
# if you do not wish to put it in any specific repository read line 30

# The other option to make the function into an actual terminal command is to go in your bash or zsh (.zshrc) config file and to add the whole function to the file. If you decide to do so do not call the function at the bottom line 98.

function create(){
    # Github credentials (login and OAUTH TOKEN)------------------------------------------------------------------------------
    USERNAME=PASTE-YOUR-USERNAME-HERE

    # go to this page to generate a new token https://github.com/settings/tokens/new
    TOKEN=PASTE-YOUR-GITHUB-OAUTH-TOKEN-HERE

    # Repository name---------------------------------------------------------------------------------------------------------
    REPOSITORY_NAME=$1

    # project description-----------------------------------------------------------------------------------------------------
    DESCRIPTION=$2

    # navigate to home directory----------------------------------------------------------------------------------------------
    cd
    CURRENTDIR=${pwd}

    # navigate to desired directories / if you do not have a specific directory for each language or you'd just like to put all your programs into a default one delete all the if statements below and keep only the <<cd /TO/YOUR/PATH/>>
    
    # ${x:l} :l converts the text to lowercase, if you wish to convert to upper case use :u
    if [[ ${3:l} == 'python' ]]
    then
    cd /Users/gabrieldesseresusini/Desktop/Gabe/Programming/Python

    elif [[ ${3:l} == 'r' ]]
    then
    cd /Users/gabrieldesseresusini/Desktop/Gabe/Programming/R
    
    elif [[ ${3:l} == 'php' ]]
    then
    cd /Users/gabrieldesseresusini/Desktop/Gabe/Programming/PHP

    elif [[ ${3:l} == 'java' ]]
    then
    cd /Users/gabrieldesseresusini/Desktop/Gabe/Programming/Java

    elif [[ ${3:l} == 'js' ]]
    then
    cd /Users/gabrieldesseresusini/Desktop/Gabe/Programming/Javascript

    elif [[ ${3:l} == 'html' ]]
    then
    cd /Users/gabrieldesseresusini/Desktop/Gabe/Programming/HTML

    else 
    cd /Users/gabrieldesseresusini/Desktop/Gabe/Programming/Random_project

    fi # end of conditions statements-----------------------------------------------------------------------------------------

    # make a new directory that would have the projects name------------------------------------------------------------------
    mkdir $REPOSITORY_NAME

    # cd into that directory--------------------------------------------------------------------------------------------------
    cd $REPOSITORY_NAME

    # initialise the empty git repository-------------------------------------------------------------------------------------
    git init

    # create a README.md file-------------------------------------------------------------------------------------------------
    touch README.md

    # add all the files to the repo-------------------------------------------------------------------------------------------
    git add .

    # commit the files--------------------------------------------------------------------------------------------------------
    git commit -m "initial commit -setup with .zsh script"

    # # use the Github API to log in------------------------------------------------------------------------------------------
    curl -H "Authorization: token $TOKEN" https://api.github.com/user/repos -d "{\"name\": \"${REPOSITORY_NAME}\", \"description\": \"${DESCRIPTION}\"}"
    
    
    # add the remote ------IF THE ${USERNAME} IS NOT WORKING SIMPLY REPLACE WITH YOUR ACTUAL GITHUB USERNAME------------------
    git remote add origin https://github.com/${USERNAME}/$REPOSITORY_NAME.git
    

    # push the repository online----------------------------------------------------------------------------------------------
    git push -u origin master
    
    # open Virtual Studio Code to start coding--------------------------------------------------------------------------------
    code .

    #  -------------IF THE ${USERNAME} IS NOT WORKING SIMPLY REPLACE WITH YOUR ACTUAL GITHUB USERNAME-------------------------
    echo "Done. Go to https://github.com/${USERNAME}/$REPOSITORY_NAME to see." 
}

create $1 $2 $3