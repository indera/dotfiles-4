all: clean install

install:
	cp -R .oh-my-zsh ~
	cp -R .rvm ~
	cp -R .tmuxinator ~

	chmod +x ~/.rvm/hooks/after_use_set_rvm_current
	chmod +x ~/.rvm/hooks/after_cd_set_rvm_current

	ln .gitconfig ~
	ln .tmux.conf ~
	ln .tmux.lightline ~
	ln .vimrc ~
	ln .zshrc ~

clean:
	rm -rf ~/.gitconfig
	rm -rf ~/.tmux.conf
	rm -rf ~/.tmux.lightline
	rm -rf ~/.vimrc
	rm -rf ~/.zshrc

