# setup
```bash
git clone git@github.com:Jiventim/dotfiles ~/.dotfiles #clone the repo
cd ~/.dotfiles #cd into it
chmod +x setup.sh #give permission
./setup.sh #run script
source ~/.bashrc #source
```


# to only clone the neovim config

```bash
#Clone the repository and set up sparse checkout
git clone --no-checkout git@github.com:Jiventim/dotfiles.git
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
```
