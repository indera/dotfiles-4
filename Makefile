all: clean install

install:
	cp -R .oh-my-zsh ~
	cp -R .tmuxinator ~

	ln .ctags ~
	ln .gitconfig ~
	ln .tmux.conf ~
	ln .vimrc-new ~/.vimrc
	ln .zshrc ~
	ln .spacemacs ~

clean:
	rm -rf ~/.ctags
	rm -rf ~/.gitconfig
	rm -rf ~/.tmux.conf
	rm -rf ~/.tmux.lightline
	rm -rf ~/.vimrc
	rm -rf ~/.zshrc
	rm -rf ~/.spacemacs

