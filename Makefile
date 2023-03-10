configs := bash \
           emacs \
           firefox \
           fish \
           git \
           htop \
           hunspell \
           matplotlib \
           mpv \
           readline \
           recoll \
           ssh \
           tmux \
           trash-cli \
           xkb \
           youtube-dl
emacs_dir := $(HOME)/meta/emacs


all: emacs-repos link


emacs-repos:
	if [ ! -d $(emacs_dir)/emacs.d ]; then \
		git clone "git@github.com:PavelNovichkov/.emacs.d.git" $(emacs_dir)/emacs.d; fi
	if [ ! -d $(emacs_dir)/chemacs2 ]; then \
		git clone "https://github.com/plexus/chemacs2.git" $(emacs_dir)/chemacs2; fi
	if [ -d $(HOME)/.emacs.d ]; then \
		mv $(HOME)/.emacs.d $(HOME)/.emacs.d.bak; fi
	ln -sf $(emacs_dir)/chemacs2 $(HOME)/.emacs.d


link:
	for config in $(configs); do stow -t $(HOME) $$config; done


unlink:
	for config in $(configs); do stow -D -t $(HOME) $$config; done
