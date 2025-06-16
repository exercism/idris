# Installation

The Idris track uses [Pack][], an Idris2 Package Manager.

### Preparation - Ubuntu 24.04 or later

```shell
sudo apt update
sudo apt install chezscheme curl gcc git libgmp-dev make
```

### Preparation - Other Linux distributions

Make sure you have a recent git, version 2.35.1 or later.

Configure Chez Scheme with support for threads.


```shell
git version
sudo apt update
sudo apt install curl gcc libgmp-dev libncurses5-dev libx11-dev make

git clone https://github.com/cisco/ChezScheme.git
cd ChezScheme
./configure --threads
make
sudo make install
cd ..
which scheme
```

### Preparation - MacOS

MacOS users can install Chez Scheme with [Homebrew][]:

```
brew update
brew install chezscheme
```

### Pack

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/stefan-hoeck/idris2-pack/main/install.bash)"
export PATH="$HOME/.pack/bin:$PATH"
pack info
```

### Troubleshooting

See Pack's detailed [installation instructions][].

### Docker Images

Stefan Höck provides Ubuntu-based [Docker images][] with Pack installed.

[Pack]: https://github.com/stefan-hoeck/idris2-pack
[Homebrew]: https://brew.sh
[installation instructions]: https://github.com/stefan-hoeck/idris2-pack/blob/main/INSTALL.md
[Docker images]: https://github.com/stefan-hoeck/idris2-pack/pkgs/container/idris2-pack
