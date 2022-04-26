fish: fish/config.fish
	cat fish/config.fish > ~/.config/fish/config.fish
	/usr/local/bin/fish ~/.config/fish/config.fish

hyper: .hyper.js
	cat .hyper.js > ~/.hyper.js

starship: starship/starship.toml
	cat starship/starship.toml > ~/.config/starship.toml

zsh: zsh/.zshrc
	mkdir -p ~/.config/zsh
	cat zsh/fzf.zsh > ~/.config/zsh/fzf.zsh
	cat zsh/.zshrc > ~/.zshrc
	/bin/zsh ~/.zshrc