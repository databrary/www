# Databrary Project Websites Generator

This project generates static content for databrary.org, datavyu.org, and labnanny.org using Pelican, a python library. It pulls content from other databrary repos, including [policies](https://github.com/databrary/policies), [datavyu](https://github.com/databrary/datavyu), and [datavyu-docs](https://github.com/databrary/datavyu-docs).

## Requirements

see requirements.txt

## Use

### Development server

`make start SITE=(databrary|datavyu|labnanny)`
`make stop SITE=(databrary|datavyu|labnanny)`

These commands start and stop the development server for the site requested on a default port, such that they can be run it parallel.

databrary
:	port 8001
datavyu
:	port 8002
labnanny
:	port 8003

It also automatically regenerates theme and content files on update. (But does not watch config files nor local static assets.)

SITE is a required parameter.

### Development output

`make html [SITE=(databrary|datavyu|labnanny)]`

This command produces HTML output with relative links and no feeds. Only useful for development.

If SITE is unspecified, it generates output for all sites.

### Publishable output

`make publish [SITE=(databrary|datavyu|labnanny)]`

This command produces HTML output with absolute links, feeds, and sitemap. It will override production site!

If SITE is unspecified, it generates output for all sites.
