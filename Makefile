configs := bash \
           emacs \
           fish \
           git \
           matplotlib \
           mpv \
           readline \
           recoll \
           ssh \
           tmux \
           trash-cli \
           xkb \
           youtube-dl
git_dir := $(HOME)/Documents/git


all: emacs-repos link services


emacs-repos:
	if [ ! -d $(git_dir)/emacs.d ]; then \
		git clone "git@github.com:extheo/.emacs.d.git" $(git_dir)/emacs.d; fi
	if [ ! -d $(git_dir)/chemacs2 ]; then \
		git clone "https://github.com/plexus/chemacs2.git" $(git_dir)/chemacs2; fi
	ln -sf $(git_dir)/chemacs2 $(HOME)/.emacs.d


link:
	for config in $(configs); do stow -t $(HOME) $$config; done


unlink:
	for config in $(configs); do stow -D -t $(HOME) $$config; done


services:
	systemctl --user enable emacs.service
