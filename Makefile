SITE?=databrary datavyu

WWW=/home/www
CONF=/etc/apache2/vhosts.d/www.conf

PORT_databrary=8001
PORT_datavyu=8002

PY=python3
PELICAN=$(PY) $(shell which pelican)
PELICANOPTS=

CONF=pelicanconf.py

ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

help:
	@echo 'Makefile for a pelican Web site                                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html [SITE=all]     (re)generate the web site          '
	@echo '   make clean               remove the generated files         '
	@echo '   make regenerate          regenerate files upon modification '
	@echo '   make stanging            publish to $(WWW)/staging'
	@echo '   make production          publish to $(WWW)'
	@echo '   make start [SITE=]       start/restart develop_server.sh    '
	@echo '   make stop                stop local server                  '
	@echo '                                                                       '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html'
	@echo '                                                                       '

OUTDIR=$*/output
regenerate: PELICANOPTS+=-r
publish: CONF=publishconf.py
staging: OUTDIR=$(WWW)/staging/$*
production: OUTDIR=$(WWW)/$*

html: generate
regenerate: generate
publish: generate
staging: publish
production: publish
	diff etc/apache.conf $(CONF) && echo "Apache config (above) needs updating."

datavyu-docs:
	$(MAKE) -C ../datavyu-docs html-pelican latexpdf
	mkdir -p datavyu/input/docs
	ln -f ../datavyu-docs/build/latex/DatavyuManual.pdf datavyu/input/docs/user-guide.pdf

policies:
	$(MAKE) -C ../policies all
	ln -sfT ../../../policies/doc databrary/input/policies

generate-databrary: policies
generate-datavyu: datavyu-docs

generate: $(addprefix generate-,$(SITE))
generate-%:
	$(PELICAN) -o $(OUTDIR) -s $*/$(CONF) $(PELICANOPTS)

clean:
	rm -rf */output

start-datavyu: datavyu-docs

start: $(addprefix start-,$(SITE))
start-%:
	./devserver.sh restart $(PORT_$*) $* &

stop: $(addprefix stop-,$(SITE))
stop-%:
	./devserver.sh stop $(PORT_$*) $*
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

.PHONY: html help clean generate regenerate start stop publish staging production
