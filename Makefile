STOW_DIRS = \
	doom \
	nvim \
	scripts \
	tmux \
	vim \
	zsh \
	work

STOW_DIRS_WORK = \
	nvim \
	scripts \
	tmux \
	vim \
	zsh \
	work

nothing:
	@echo "Usage:"
	@echo "    make all      stow all files"
	@echo "    make clean    unstow all files"
	@echo "    make tmux     fetch tmux config"

all:
	@for DIR in ${STOW_DIRS}; do \
		 stow --target=$${HOME} -v $${DIR}; \
	done

all_work:
	@for DIR in ${STOW_DIRS_WORK}; do \
		 stow --target=$${HOME} -v $${DIR}; \
	done

clean:
	@for DIR in ${STOW_DIRS}; do \
		 stow --target=$${HOME} --delete -v $${DIR}; \
	done

clean_work:
	@for DIR in ${STOW_DIRS_WORK}; do \
		 stow --target=$${HOME} --delete -v $${DIR}; \
	done

.PHONY: tmux
tmux:
	@echo ">>> tmux >>>"
	TMUX_DIR=${HOME}/.config/tmux
	@if [ -f "${TMUX_DIR}/.tmux.conf" ]; then \
		git --git-dir ${TMUX_DIR}/.git/ --work-tree=${TMUX_DIR} pull; \
	else \
		git clone https://github.com/gpakosz/.tmux.git ${TMUX_DIR}; \
		ln -s -f ${TMUX_DIR}/.tmux.conf ${HOME}/.tmux.conf; \
	fi
	@echo "<<< tmux <<<"

