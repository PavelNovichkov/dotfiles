configs := bash \
           emacs \
           fish \
           git \
           gnome \
           go \
           gopass \
           htop \
           hunspell \
           matplotlib \
           mpv \
           rclone \
           readline \
           recoll \
           tmux \
           xkb \
           youtube-dl


all: link


link:
	for config in $(configs); do stow --no-folding -t $(HOME) $$config; done


unlink:
	for config in $(configs); do stow --no-folding -D -t $(HOME) $$config; done
