# entr.kak

[`entr`](http://eradman.com/entrproject) integration for the [Kakoune](http://kakoune.org/) editor. 
As such, this plugin requires `entr` to be installed.


## Commands

### entr

The `:entr [<entr options>]` command will pass all arguments to the `entr` utility and watch all 
files in the current directory for changes.


## Installation

### Using plug.kak

To install with [plug.kak](https://github.com/andreyorst/plug.kak), add the following line to your 
`kakrc`:

```
plug "jwhett/entr-kak"
```

Run `:plug-install` to install.

> Use `:plug-update` to update.


### Manual (plugin directory)

Clone this repository into a `plugins` directory and source:

```sh
mkdir -p ~/.config/kak/plugins
git clone https://github.com/jwhett/entr-kak.git ~/.config/kak/plugins/entr-kak
```

Add the following to your `kakrc`.

```
source "%val{config}/plugins/entr-kak/entr.kak
```
