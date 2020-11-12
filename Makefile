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

datavyu/input/pages/user-guide/index.html: .PHONY
	$(MAKE) -C ../datavyu-docs html-pelican
datavyu/input/docs/user-guide.pdf: .PHONY
	$(MAKE) -C ../datavyu-docs latexpdf
	mkdir -p $(dir $@)
	ln -f ../datavyu-docs/build/latex/DatavyuManual.pdf $@
$(datavyu_files): .PHONY
databrary/input/policies: .PHONY
	#$(MAKE) -C ../policies clean
	$(MAKE) -C ../policies all
	rm -f $@
	ln -sf ../../../policies/doc $@

.PHONY: clean
clean:
	rm -rf output
	rm -rf databrary/__pycache__
	rm -rf databrary/cache
	rm -rf datavyu/__pycache__
	rm -rf datavyu/cache

start: clean generate $(addprefix start-,$(SITE))
start-%: FORCE
	./devserver.sh restart $(PORT_$*) $* &

stop: $(addprefix stop-,$(SITE))
stop-%: FORCE
	./devserver.sh stop $(PORT_$*) $*
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

FORCE:

##############################################################################
# Github Action Support
##############################################################################
deploy_branch=gh-pages
deploy_directory=output/databrary
repo=origin

.PHONY: docker-build
docker-build:
	docker build -t databraryorg/databrary-static-action:0.1 .

.PHONY: docker-build-no-cache
docker-build-no-cache:
	docker build --no-cache -t databraryorg/databrary-static-action:0.1 .

docker-push: docker-build
	docker push databraryorg/databrary-static-action:0.1

.PHONY: clean-static-dev
clean-static-dev:
	rm -rf $(dir $(deploy_directory))
	git worktree prune

.PHONY: update-repos
update-repos:
	cd ../policies; \
	git pull; \
	cd ../www; \
	git pull; \
	pip3 install -r requirements-freeze.txt

update-static-dev: clean-static-dev
	@if [ -z "$(GITHUB_SHA)" ]; then \
		commit_message="Deploy update";\
	else\
		commit_message="Deploy update from $(GITHUB_SHA)";\
	fi;\
	if [ -z "$(INPUT_GITHUB_TOKEN)" ]; then \
	 	remote_repo="origin";\
	else\
		remote_repo="https://x-access-token:$(INPUT_GITHUB_TOKEN)@github.com/databrary/www.git";\
	fi;\
	mkdir -p $(deploy_directory);\
	git worktree add -B $(deploy_branch) $(deploy_directory) $(repo)/$(deploy_branch);\
	make generate SITE=databrary;\
	cd "$(deploy_directory)";\
	git add --all;\
	git commit -m "$$commit_message";\
	git push "$$remote_repo" $(deploy_branch);\
	cd ../../;\
	$(MAKE) clean-static-dev;

gh-action: update-static-dev

.PHONY: keep-container-running
keep-container-running:
	tail -f /dev/null

##############################################################################

.PHONY: docker-something
docker-something:
	docker create --name databrary-static-action-local databraryorg/databrary-static-action:0.1 keep-container-running || true
	docker start databrary-static-action-local
	docker cp ../policies databrary-static-action-local:/build/
	docker cp ../www databrary-static-action-local:/build/
	docker exec databrary-static-action-local "cd /build/www/ && make generate SITE=databrary"
	docker stop databrary-static-action-local

.PHONY: docker-local-remote
docker-local-remote:
	docker pull databraryorg/databrary-static-action:0.1

.PHONY: docker-local-build
docker-local-build: docker-build docker-something

##############################################################################

all: help
FORCE: # Here in case we forget to put it in a relevant section.

# Some of the above conventions come from
# https://clarkgrubb.com/makefile-style-guide, an often cited style guide for
# Makefiles. This includes using FORCE for targets with an argument
# (e.g., hello-%) and "Add each phony target as a prerequisite of .PHONY
# immediately before the target declaration, rather than listing all the
# phony targets in a single place."