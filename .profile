# connor's bash .profile
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


export PS1="[\[$(tput sgr0)\]\[\033[38;5;9m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]][\u@\[$(tput sgr0)\]\[\033[38;5;202m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]][\w]: \[$(tput sgr0)\]"
export PATH=$PATH:~/bin

alias rm='rm -i' #Require confirmation to delete stuff. can overide w/ -f
alias cp='cp -iv' #Confirm for overwrite + more verbosity
alias mkdir='mkdir -pv' #Makes any preceeding folders if needed + more verbosity


#Quicker navigation
alias editBashProfile='vim ~/.profile' # open .bash_profile in editor
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels


#-------------- BLUEBEAR & BHAM specific --------------

# Start up an interactive job (useul for Rstudio or anything w/ X11)
alias int-job="module load slurm-interactive; fisbatch_screen --nodes 1-1 --ntasks 4 --time 8:0:0"


#Rough wrapper for "sbatch" to allow for quick cancellation of last job when testing
qsub () {
        jobscript="$1"
        if [[ ! -f "$jobscript" ]]; then
                echo "You need to specify a job to submit..."
        else
        lastjob=$(sbatch --parsable $jobscript)
        echo "-------------------------------------------------------"
        echo "Submitted w/ job ID: $lastjob -- Run "qcancel" to cancel the most recent job submitted w/ qsub."
        echo "$lastjob" > ~/.lastjob    #store last jobID across shell restarts
        echo "-------------------------------------------------------"
        squeue
        echo "-------------------------------------------------------"
        fi
}
qcancel () {
        if [[ ! -f ~/.lastjob ]]; then
                echo "Submit a job with qsub first!"
        else
        lastjob=$(cat ~/.lastjob)
        scancel $lastjob
        rm -f ~/.lastjob
        echo "Cancelled $lastjob! -- Currently running jobs below:"
        echo "-------------------------------------------------------"
        squeue
        echo "-------------------------------------------------------"
        fi
}
