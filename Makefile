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

##############################################################################
# Github Action Support
##############################################################################

docker-build: PHONY
	docker build -t databraryorg/databrary-static-action:0.1 .

docker-build-no-cache: PHONY
	docker build --no-cache -t databraryorg/databrary-static-action:0.1 .

docker-push: docker-build
	docker push databraryorg/databrary-static-action:0.1

deploy_branch=gh-pages
deploy_directory=output/databrary
repo=origin
ifeq ($(GITHUB_SHA),)
	commit_message=Deploy update
else
	commit_message=Deploy update from $(GITHUB_SHA)
endif
ifeq ($(INPUT_GITHUB_TOKEN),)
	remote_repo=origin
else
	remote_repo=https://x-access-token:$(INPUT_GITHUB_TOKEN)@github.com/databrary/www.git
endif

clean-static-dev: PHONY
	rm -rf $(dir $(deploy_directory))
	git worktree prune

update-repos: PHONY
	env
	cd ../policies
	git pull
	cd ../www
	git pull
	pip3 install -r requirements-freeze.txt

update-static-dev: clean-static-dev PHONY
	mkdir -p $(deploy_directory)
	git worktree add -B $(deploy_branch) $(deploy_directory) $(repo)/$(deploy_branch)
	make generate SITE=databrary
	cd "$(deploy_directory)"
	-git add --all
	-git commit -m "$(commit_message)"
	-git push "${remote_repo}" $(deploy_branch)
	cd ../../
	$(MAKE) clean-static-dev

gh-action: #update-static-dev
	echo $(INPUT_GITHUB_TOKEN)
	echo $(GITHUB_SHA)

##############################################################################

all:
.PHONY: FORCE PHONY html help clean generate regenerate start stop publish staging production deploy
