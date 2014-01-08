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

INPUTDIR=$(BASEDIR)/input
OUTPUTDIR=$(BASEDIR)/output

PELICANCONF=pelicanconf.py
PUBLISHCONF=publishconf.py

FTP_HOST=localhost
FTP_USER=anonymous
FTP_TARGET_DIR=/

SSH_HOST=localhost
SSH_PORT=22
SSH_USER=root
SSH_TARGET_DIR=/var/www

S3_BUCKET=my_s3_bucket

CLOUDFILES_USERNAME=my_rackspace_username
CLOUDFILES_API_KEY=my_rackspace_api_key
CLOUDFILES_CONTAINER=my_cloudfiles_container

DROPBOX_DIR=~/Dropbox/Public/

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
	@echo '   make dropbox_upload              upload the web site via Dropbox    '
	@echo '   make ftp_upload                  upload the web site via FTP        '
	@echo '   make s3_upload                   upload the web site via S3         '
	@echo '   make cf_upload                   upload the web site via Cloud Files'
	@echo '   make github                      upload the web site via gh-pages   '
	@echo '                                                                       '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html'
	@echo '                                                                       '

html:
ifeq ($(SITE), all)
	cd ../docs-datavyu && make html-pelican && cd -
	$(PELICAN) -s $(CURDIR)/databrary/$(PELICANCONF) $(PELICANOPTS)
	$(PELICAN) -s $(CURDIR)/datavyu/$(PELICANCONF) $(PELICANOPTS)
	$(PELICAN) -s $(CURDIR)/labnanny/$(PELICANCONF) $(PELICANOPTS)
else
	$(PELICAN) -s $(BASEDIR)/$(PELICANCONF) $(PELICANOPTS)
endif

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

regenerate:
ifeq ($(SITE), all)
	cd $(CURDIR)/databrary && $(PELICAN) -r -s $(CURDIR)/databrary/$(PELICANCONF) $(PELICANOPTS) && cd -
	cd $(CURDIR)/datavyu && $(PELICAN) -r -s $(CURDIR)/datavyu/$(PELICANCONF) $(PELICANOPTS) && cd -
	cd $(CURDIR)/labnanny && $(PELICAN) -r -s $(CURDIR)/labnanny/$(PELICANCONF) $(PELICANOPTS) && cd -
else
	$(PELICAN) -r -s $(BASEDIR)/$(PELICANCONF) $(PELICANOPTS)
endif

serve:
ifdef PORT
	cd $(OUTPUTDIR) && $(PY) -m pelican.server $(PORT)
else
	cd $(OUTPUTDIR) && $(PY) -m pelican.server
endif

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

dropbox_upload: publish
	cp -r $(OUTPUTDIR)/* $(DROPBOX_DIR)

ftp_upload: publish
	lftp ftp://$(FTP_USER)@$(FTP_HOST) -e "mirror -R $(OUTPUTDIR) $(FTP_TARGET_DIR) ; quit"

s3_upload: publish
	s3cmd sync $(OUTPUTDIR)/ s3://$(S3_BUCKET) --acl-public --delete-removed

cf_upload: publish
	cd $(OUTPUTDIR) && swift -v -A https://auth.api.rackspacecloud.com/v1.0 -U $(CLOUDFILES_USERNAME) -K $(CLOUDFILES_API_KEY) upload -c $(CLOUDFILES_CONTAINER) .

github: publish
	ghp-import $(OUTPUTDIR)
	git push origin gh-pages

.PHONY: html help clean regenerate serve devserver publish ssh_upload rsync_upload dropbox_upload ftp_upload s3_upload cf_upload github
