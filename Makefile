all:
	mkdir -p ~/.emacs.d
	ln -s ${PWD}/init.el ~/.emacs.d/init.el
	ln -s ${PWD}/config ~/.emacs.d/config
