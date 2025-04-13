# misc

`clang` needs VS built tools, found here
```txt
https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=buildtools
```

# wingets

For `clang` (Interactive mode to add clang to PATH)
```ps1
winget install -i LLVM.LLVM
```
```ps1
winget install --id Git.Git -e 
```
```ps1
winget install --id Neovim.Neovim --source winget
```
```ps1
winget install --id Neovim.Neovim --source winget
```

# symlink nvim config
```ps1
New-Item -Target .\dotfiles\nvim -ItemType SymbolicLink -Path ${env:USERPROFILE}\AppData\Local -Name "nvim"
```
