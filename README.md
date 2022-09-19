# Background

This project generates static content for databrary.org and datavyu.org using Pelican, a python library. It pulls content from other databrary repos, including [policies](https://github.com/databrary/policies), [datavyu](https://github.com/databrary/datavyu), and [datavyu-docs](https://github.com/databrary/datavyu-docs).

## Tips

### Editing Documents

Pages and posts can be written in markdown (.md) restructured text (.rst) or in html (.html). In any document format, the headers are essential to generating valid web pages.

### Headings

Do not use H1 to represent the title of a document. Use H1s as the highest level of your page outline. You can have multiple H1s.

### Development server

We recommend using [pyenv](https://github.com/pyenv/pyenv) to manage your Python installs and virtual environments. You can follow detailed instructions [here](https://github.com/pyenv/pyenv) for pyenv and [here](https://github.com/pyenv/pyenv-virtualenv) for pyenv-virtualenv, but the gist is as follows:

### Prepare

#### macOS

You have a couple options, but we recommend either Homebrew ([install](https://brew.sh/)) or the instructions below for Linux.

In Terminal enter:

```Shell
brew update
brew install pyenv
brew install pyenv-virtualenv
```

#### Linux and Windows WSL

These instructions are for BASH, but see

```Shell
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
exec "$SHELL"
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
exec "$SHELL"
```

### Install the correct version of Python and create a virtual environment

```Shell
pyenv install 3.7.7
pyenv virtualenv 3.7.7 dbpelican3
```

### Git clone if you haven't already

```Shell
mkdir databrary_docs
git clone https://github.com/databrary/www.git
git clone https://github.com/databrary/policies.git
```

### Install Python requirements

```Shell
cd www
peynv activate dbpelican3
pip install -r requirements-freeze.txt
```

## Build the docs and start a dev server

These commands start and stop the development server for the site requested on a default port, such that they can be run it parallel:

```Shell
cd databrary_docs/www
pyenv activate dbpelican3
make start SITE=(databrary|datavyu)
make stop SITE=(databrary|datavyu)
```

| Site      | Port |
| --------- | ---- |
| databrary | 8001 |
| datavyu   | 8002 |

It also automatically regenerates theme and content files on update. (But does not watch config files nor local static assets.)

SITE is a required parameter.

`pyenv deactivate` to leave virtualenv.

### Development output

`make html [SITE=(databrary|datavyu)]`

This command produces HTML output with relative links and no feeds. Only useful for development.

If SITE is unspecified, it generates output for all sites.

### Publishable output

`make publish [SITE=(databrary|datavyu)]`

This command produces HTML output with absolute links, feeds, and sitemap. It will override production site!

If SITE is unspecified, it generates output for all sites.

### If you're compiling DV

```Shell
pyenv install 2.7.18
pyenv virtualenv 2.7.18 dvpelican2
cd ..
git clone https://github.com/databrary/datavyu.git
git clone https://github.com/databrary/datavyu-docs.git
cd datavyu-docs
pyenv active dvpelican2
pip install -r requirements-freeze.txt
cd ../www
make start SITE=datavyu PYTHON2BIN=~/.pyenv/versions/dvpelican2/bin
```
