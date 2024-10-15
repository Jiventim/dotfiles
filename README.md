
# dotfiles

to only clone the nvim directory:
```bash
git clone --no-checkout git@github.com:Jiventim/dotfiles.git
cd dotfiles
git sparse-checkout init --cone
git sparse-checkout set nvim
git checkout main
mkdir -p ~/.config/nvim
mv ~/dotfiles/nvim ~/.config/nvim/
rm -rf ~/dotfiles #optional
```
