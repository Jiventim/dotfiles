# setup
```bash
git clone git@github.com:Jiventimsina/dotfiles ~/.dotfiles #clone the repo
cd ~/.dotfiles #cd into it
chmod +x setup.sh #give permission
./setup.sh #run script
#source
source ~/.zshrc
```


# to only clone the neovim config

## Requirement
### Go to Lazyvim website to download required tools before proceeding
[visit Lazyvim.org](https://www.lazyvim.org)

### also don't forget to backup your current neovim config (if any)
```bash
#Clone the repository and set up sparse checkout
git clone --no-checkout git@github.com:Jiventimsina/dotfiles.git
cd dotfiles
git sparse-checkout init --cone
git sparse-checkout set nvim
git checkout main

#Create the destination directory and move the nvim files
mkdir -p ~/.config/nvim
mv nvim/* ~/.config/nvim/

# Navigate out and remove the cloned repository (optional)
cd
rm -rf ~/dotfiles

# Open neovim and grab yourself a coffee until it downloads all the plugins
nvim
```
