dotfiles
=========

Installation
------------

00. Install dotfiles:
    * Set zsh as your login shell if it isn't already: 
    ```
    $ chsh -s $(which zsh)
    ```
    * Perform the installation:
    ```
    % git clone --recursive git@github.com:ffleming/dotfiles.git ~/.dotfiles
    ```
00. Install rcm: 
    ```
    brew tap thoughtbot/formulae && brew install rcm
    ```
00. Link dotfiles:
    ```
    % env RCRC=$HOME/.dotfiles/rcrc rcup
    ```
00. Run thoughtbot's [laptop script](http://github.com/thoughtbot/laptop):

Features
-------- 

* A simple but informative Git prompt (all the pre-made ones I could find were either too busy or too uninformative for my purposes). 
    - Shows the current branch name or commit id.
    - Color-coding by status: clean, clean but not pushed, uncommitted.
* `reload!` to source `~/.zshrc`
* Safeguard aliases for destructive shell commands
* `desktop (show/hide)` to show/hide the Desktop (for Macs)
* `hidden_files (show/hide)` to show/hide hidden files (Macs)
* `update_homebrew` to run brew update, upgrade, cleanup, and doctor
* `github init` to initialize a GitHub repo for the current Git repo and push to it
* `git create` to initialize a git repo and and then call `github init`

Originally forked from [Jake Romer's dotfiles](https://github.com/jkrmr/dotfiles), themselves forked from [Thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles).  I have sinced moved them to a new repository, but many of the functions, etc. are theirs.
