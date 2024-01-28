STOW_DIRS = \
	alacritty \
	nvim \
	scripts \
	tmux \
	vim \
	zsh

ZSH_DIR=${HOME}/.config/zsh
NVIM_DIR=${HOME}/.config/nvim
TMUX_DIR=${HOME}/.config/tmux
PYENV_DIR=${HOME}/.config/pyenv

nothing:
	@echo "Usage:"
	@echo "    make all            stow all files"
	@echo "    make clean          unstow all files"
	@echo "    make nvim           stow neovim"
	@echo "    make nvim_clean     unstow neovim"
	@echo "    make pyenv          install pyenv"
	@echo "    make tmux           fetch tmux config"

all:
	@for DIR in ${STOW_DIRS}; do \
		 stow --target=$${HOME} -v --no-folding $${DIR}; \
	done

.PHONY: work
work:
	@for DIR in ${STOW_DIRS_WORK}; do \
		 stow --target=$${HOME} -v --no-folding $${DIR}; \
	done

freebsd:
	@for DIR in ${STOW_DIRS_FBSD}; do \
		 stow --target=$${HOME} -v --no-folding $${DIR}; \
	done

clean:
	@for DIR in ${STOW_DIRS}; do \
		 stow --target=$${HOME} --delete -v --no-folding $${DIR}; \
	done

work_clean:
	@for DIR in ${STOW_DIRS_WORK}; do \
		 stow --target=$${HOME} --delete -v --no-folding $${DIR}; \
	done

freebsd_clean:
	@for DIR in ${STOW_DIRS_FBSD}; do \
		 stow --target=$${HOME} --delete -v --no-folding $${DIR}; \
	done

.PHONY: tmux
tmux:
	@echo ">>> tmux >>>"
	@if [ -f "${TMUX_DIR}/.tmux.conf" ]; then \
		git --git-dir ${TMUX_DIR}/.git/ --work-tree=${TMUX_DIR} pull; \
	else \
		git clone https://github.com/gpakosz/.tmux.git ${TMUX_DIR}; \
		ln -s -f ${TMUX_DIR}/.tmux.conf ${HOME}/.tmux.conf; \
	fi
	@echo "<<< tmux <<<"

.PHONY: pyenv
pyenv:
	@echo ">>> pyenv >>>"
	@if [ -d "${PYENV_DIR}" ]; then \
		git --git-dir ${PYENV_DIR}/.git/ --work-tree=${PYENV_DIR} pull; \
	else \
		git clone https://github.com/pyenv/pyenv.git ${PYENV_DIR}; \
	fi
	@echo "<<< pyenv <<<"

.PHONY: nvim
nvim:
	stow --target=$${HOME} -v --no-folding nvim

.PHONY: nvim_clean
nvim_clean:
	stow --target=$${HOME} --delete -v --no-folding nvim
