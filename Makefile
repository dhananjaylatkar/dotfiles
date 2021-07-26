STOW_DIRS = \
			doom \
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

all:
	@for DIR in ${STOW_DIRS}; do \
		 stow --target=$${HOME} -v $${DIR}; \
	done

clean:
	@for DIR in ${STOW_DIRS}; do \
		 stow --target=$${HOME} --delete -v $${DIR}; \
	done

