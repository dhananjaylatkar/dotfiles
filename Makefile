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

ZSH_DIR=${HOME}/.config/zsh
NVIM_DIR=${HOME}/.config/nvim
TMUX_DIR=${HOME}/.config/tmux
PYENV_DIR=${HOME}/.config/pyenv
nothing:
	@echo "Usage:"
	@echo "    make all      stow all files"
	@echo "    make clean    unstow all files"
	@echo "    make tmux     fetch tmux config"

all: prep
	@for DIR in ${STOW_DIRS}; do \
		 stow --target=$${HOME} -v $${DIR}; \
	done

all_work: prep
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

prep:
	# Create tmp files so that whole folder does't get linked by stow.
	@mkdir -p ${ZSH_DIR} ${NVIM_DIR}
	@touch ${ZSH_DIR}/.tmp ${NVIM_DIR}/.tmp

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

