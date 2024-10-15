to only clone the nvim directory:

## Clone the repository and set up sparse checkout
```bash
git clone --no-checkout git@github.com:Jiventim/dotfiles.git
cd dotfiles
git sparse-checkout init --cone
git sparse-checkout set nvim
git checkout main
```
## Create the destination directory and move the nvim files
```bash
mkdir -p ~/.config/nvim
mv nvim/* ~/.config/nvim/
```
## Navigate out and remove the cloned repository
```bash
cd ~  # Go back to home directory
rm -rf ~/dotfiles  # Remove the dotfiles directory
```
