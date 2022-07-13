# plasticine-nvim

## Install

### telescope

该插件用于提供文件搜索和`Symbol`搜索功能（即能够搜索具体某个文件中的变量、函数等）

但是它依赖于下面这两个包：

1. `fd`
2. `ripgrep`

需要先安装这两个包才能让`telescope`正常工作

#### 安装 fd

该插件依赖于[fd](https://github.com/sharkdp/fd)，需要先安装

以`Ubuntu`为例：

```shell
sudo apt install fd-find
```

详细安装方式请见[fd installation](https://github.com/sharkdp/fd#installation)

#### 安装 ripgrep

以`Ubuntu`为例：

```shell
sudo apt install ripgrep
```

详细安装方式请见[ripgrep installation](https://github.com/BurntSushi/ripgrep#installation)

---

### null-ls

如果需要给`lua`使用代码格式化，需要安装`stylua`

在 [stylua release](https://github.com/JohnnyMorganz/StyLua/releases) 中下载对应二进制文件放到系统环境变量目录即可

`prettier`也是同理，总之就是要用到什么语言的格式化工具就要先安装才能使用

---

## Usage

使用符号链接的方式将配置文件链接到`~/.config/nvim`中即可

```shell
git clone https://github.com/Plasticine-Yang/plasticine-nvim.git ~
ln -s ~/plasticine-nvim/nvim ~/.config/nvim
```

可以切换分支来查看每个阶段的配置

```shell
cd ~/plasticine-nvim
git checkout 01-options
```
