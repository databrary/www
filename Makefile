SITE?=databrary datavyu

WWW=/home/www
APACHE=/etc/apache2/vhosts.d/www.conf

PORT_databrary=8001
PORT_datavyu=8002

PY=python
PELICAN=pelican
PELICANOPTS=-v

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
	@echo '   make staging             publish to $(WWW)/staging'
	@echo '   make production          publish to $(WWW)'
	@echo '   make deploy              update and publish to $(WWW)'
	@echo '   make start [SITE=]       start/restart develop_server.sh    '
	@echo '   make stop                stop local server                  '
	@echo '                                                                       '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html'
	@echo '                                                                       '

regenerate: PELICANOPTS+=-r
publish: CONF=publishconf.py

ifneq ($(filter staging,$(MAKECMDGOALS)),)
OUTDIR=$(WWW)/staging
else ifneq ($(filter production deploy,$(MAKECMDGOALS)),)
OUTDIR=$(WWW)
else
OUTDIR=output
endif
ifneq ($(filter deploy,$(MAKECMDGOALS)),)
UPDATE:=FORCE
else
REGEN:=FORCE
endif

html: generate
regenerate: generate
publish: generate
staging: publish
production: publish
deploy: production
	@diff etc/apache.conf $(APACHE) || echo "Apache config (above) needs updating."

generate: $(SITE:%=$(OUTDIR)/%/index.html)
$(OUTDIR)/%/index.html: FORCE
	$(PELICAN) -o $(OUTDIR)/$* -s $*/$(CONF) $(PELICANOPTS)

datavyu_files:=$(addprefix ../datavyu/,version.txt pre_version.txt RELEASE-NOTES.md)
$(OUTDIR)/datavyu/index.html: datavyu/input/pages/user-guide/index.html datavyu/input/docs/user-guide.pdf $(datavyu_files)
$(OUTDIR)/databrary/index.html: databrary/input/policies

datavyu/input/pages/user-guide/index.html: FORCE
	$(MAKE) -C ../datavyu-docs html-pelican
datavyu/input/docs/user-guide.pdf: FORCE
	$(MAKE) -C ../datavyu-docs latexpdf
	mkdir -p $(dir $@)
	ln -f ../datavyu-docs/build/latex/DatavyuManual.pdf $@
$(datavyu_files): FORCE
databrary/input/policies: FORCE
	#$(MAKE) -C ../policies clean
	$(MAKE) -C ../policies all
	rm -f $@
	ln -sf ../../../policies/doc $@

clean:
	rm -rf output
	rm -rf databrary/__pycache__
	rm -rf databrary/cache
	rm -rf datavyu/__pycache__
	rm -rf datavyu/cache

start: clean generate $(addprefix start-,$(SITE))
start-%:
	./devserver.sh restart $(PORT_$*) $* &

stop: $(addprefix stop-,$(SITE))
stop-%:
	./devserver.sh stop $(PORT_$*) $*
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

.PHONY: FORCE html help clean generate regenerate start stop publish staging production deploy
