# Editing Documents

Pages and posts can be written in markdown (.md) restructured text (.rst) or in html (.html). In any document format, the headers are essential to generating valid web pages.

## Headings

Do not use H1 to represent the title of a document. Use H1s as the highest level of your page outline. You can have multiple H1s.

# Databrary Project Websites Generator

This project generates static content for databrary.org and datavyu.org using Pelican, a python library. It pulls content from other databrary repos, including [policies](https://github.com/databrary/policies), [datavyu](https://github.com/databrary/datavyu), and [datavyu-docs](https://github.com/databrary/datavyu-docs).

## Development server

### Prepare
We recommend using [pyenv](https://github.com/pyenv/pyenv) to manage your Python installs and [pipenv](https://github.com/pypa/pipenv) for virtual environments. See the respective projects for detailed instructions on setting up the tools:

System dependencies: [pandoc](https://pandoc.org/), latex2pdf, [sphinx](https://www.sphinx-doc.org/en/master/), [latexmk](https://mg.readthedocs.io/latexmk.html), pelican, yard

For Ubuntu:
```Shell
sudo apt install python3-sphinx pandoc texlive-latex-base texlive-latex-recommended texlive-latex-extra latexmk
```

### Git clone if you haven't already

```Shell
mkdir databrary_docs && cd databrary_docs
git clone https://github.com/databrary/www.git
git clone https://github.com/databrary/policies.git
```

### Set up project virtual environment

```Shell
cd www
pipenv install
```

`pipenv` will prompt you to install the Python version specified in the Pipfile if you also installed `pyenv`. NOTE: make sure to install the build dependencies listed on the `pyenv` project page.


### Build the docs and start a dev server

These commands start and stop the development server for the site requested on a default port, such that they can be run it parallel:

```Shell
pipenv shell
make start SITE=(databrary|datavyu)
make stop SITE=(databrary|datavyu)
```

| Site      | Port |
| --------- | ---- |
| databrary | 8001 |
| datavyu   | 8002 |

It also automatically regenerates theme and content files on update. (But does not watch config files nor local static assets.)

SITE is a required parameter.

## Development output

`make html [SITE=(databrary|datavyu)]`

This command produces HTML output with relative links and no feeds. Only useful for development.

If SITE is unspecified, it generates output for all sites.

## Publishable output

`make publish [SITE=(databrary|datavyu)]`

This command produces HTML output with absolute links, feeds, and sitemap. It will override production site!

If SITE is unspecified, it generates output for all sites.

## If you're compiling DV

```Shell
cd ..
git clone https://github.com/databrary/datavyu.git
git clone https:/github.com/databrary/datavyu-docs.git
cd datavyu-docs
pipenv install
cd ../www
make start SITE=datavyu
```
