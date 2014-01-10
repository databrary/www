SITE?=all

PORT_all=
PORT_databrary=8001
PORT_datavyu=8002
PORT_labnanny=8003

PORT?=$(PORT_$(SITE))

BASEDIR=$(CURDIR)/$(SITE)

PY=python
PELICAN=$(CURDIR)/env/bin/pelican
PELICANOPTS=

OUTPUTDIR=$(BASEDIR)/output

PELICANCONF=pelicanconf.py
PUBLISHCONF=publishconf.py

SSH_HOST=localhost
SSH_PORT=22
SSH_USER=root
SSH_TARGET_DIR=/var/www

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

help:
	@echo 'Makefile for a pelican Web site                                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html [SITE=all]             (re)generate the web site          '
	@echo '   make clean                       remove the generated files         '
	@echo '   make regenerate                  regenerate files upon modification '
	@echo '   make publish [SITE=all]          generate using production settings '
	@echo '   make serve [SITE=]               serve site at http://localhost:8000'
	@echo '   make devserver [SITE=]           start/restart develop_server.sh    '
	@echo '   make stopserver                  stop local server                  '
	@echo '   make ssh_upload                  upload the web site via SSH        '
	@echo '   make rsync_upload                upload the web site via rsync+ssh  '
	@echo '   make github                      upload the web site via gh-pages   '
	@echo '                                                                       '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html'
	@echo '                                                                       '

html:
ifeq ($(SITE), all)
	$(MAKE) -C ../docs-datavyu html-pelican
	$(PELICAN) -s $(CURDIR)/databrary/$(PELICANCONF) $(PELICANOPTS)
	$(PELICAN) -s $(CURDIR)/datavyu/$(PELICANCONF) $(PELICANOPTS)
	$(PELICAN) -s $(CURDIR)/labnanny/$(PELICANCONF) $(PELICANOPTS)
else
	$(PELICAN) -s $(BASEDIR)/$(PELICANCONF) $(PELICANOPTS)
endif

clean:
	rm -rf $(OUTPUTDIR)

regenerate:
ifeq ($(SITE), all)
	cd $(CURDIR)/databrary && $(PELICAN) -r -s $(CURDIR)/databrary/$(PELICANCONF) $(PELICANOPTS)
	cd $(CURDIR)/datavyu && $(PELICAN) -r -s $(CURDIR)/datavyu/$(PELICANCONF) $(PELICANOPTS)
	cd $(CURDIR)/labnanny && $(PELICAN) -r -s $(CURDIR)/labnanny/$(PELICANCONF) $(PELICANOPTS)
else
	$(PELICAN) -r -s $(BASEDIR)/$(PELICANCONF) $(PELICANOPTS)
endif

serve:
	cd $(OUTPUTDIR) && $(PY) -m pelican.server $(PORT)

devserver:
ifdef PORT
	$(CURDIR)/devserver.sh restart $(PORT) $(SITE)
else
	@echo 'Hey! Like this:'
	@echo '    make devserver SITE=[databrary|datavyu|labnanny]'
endif

stopserver:
	kill -9 `cat pelican.pid`
	kill -9 `cat srv.pid`
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

publish:
ifeq ($(SITE), all)
	$(MAKE) -C ../docs-datavyu html-pelican
	$(PELICAN) -s $(CURDIR)/databrary/$(PUBLISHCONF) $(PELICANOPTS)
	$(PELICAN) -s $(CURDIR)/datavyu/$(PUBLISHCONF) $(PELICANOPTS)
	$(PELICAN) -s $(CURDIR)/labnanny/$(PUBLISHCONF) $(PELICANOPTS)
else
	$(PELICAN) -s $(BASEDIR)/$(PUBLISHCONF) $(PELICANOPTS)
endif

ssh_upload: publish
	scp -P $(SSH_PORT) -r $(OUTPUTDIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

rsync_upload: publish
	rsync -e "ssh -p $(SSH_PORT)" -P -rvz --delete $(OUTPUTDIR)/ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR) --cvs-exclude

github: publish
	ghp-import $(OUTPUTDIR)
	git push origin gh-pages

.PHONY: html help clean regenerate serve devserver publish ssh_upload rsync_upload github
