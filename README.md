configs
=======

This repository was created with
[configmanager](https://github.com/tarcisioe/configmanager)

Every branch except for master is extremely unreliable: they are
created for specific cases and may be rebased at any moment
against master.

If you clone this repository, it is recommended that you use it
to base your own configurations on, instead of always updating
from it. I might at any moment make changes you won't like.

Using these configurations
--------------------------

To install the configurations, enter the cloned repository and run:

*Note: this will overwrite any configuration files mapped by this
repository*

```bash
git submodule init
git submodule update
bash link.sh
bash migrate.sh
```

Using single files
------------------

To use a single configuration file or directory, use `use.sh`

```bash
git submodule init
git submodule update
bash use.sh vim
bash use.sh i3config
```

Vim configurations
------------------

The vim/vimrc contained in this repository uses
[vundle](https://github.com/gmarik/Vundle.vim) to manage plugins and
packages for vim. After installing the configfiles, open vim and run

```vim
:BundleInstall
```

And you can keep your bundles up to date by running

```vim
:BundleUpdate
```

whenever needed.
