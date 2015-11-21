#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# PATHS
import os
import sys
sys.path.append(os.curdir)

# CONFIG
from common.pelicanconf import *

# SITE
SITENAME = 'Datavyu: Video coding and data visualization tool'
SITESLUG = 'datavyu'

PAGINATION_PATTERNS = (
  (1, '{base_name}/', '{base_name}/index.html'),
  (2, '{base_name}/page{number}.html', '{base_name}/page{number}.html'),
)

# COMPILE
OUTPUT_RETENTION = ('maven2', 'releases', 'releases_pre', 'support', 'bugs')

STATIC_PATHS.extend([
	'docs',
	'releases',
	'releases_pre',
	'pages/user-guide/.buildinfo',
	'pages/user-guide/objects.inv',
	'pages/user-guide/searchindex.js',
	'pages/user-guide/_downloads',
	'pages/user-guide/_images',
	'pages/user-guide/_sources',
	'pages/user-guide/_static',
        'robots.txt'
])

TEMPLATE_PAGES = {
	'../../../datavyu/version.txt': 'version.txt',
	'../../../datavyu/pre_version.txt': 'pre_version.txt',
}

EXTRA_PATH_METADATA = {}

for dirpath, dirnames, filenames in os.walk(os.curdir+'/datavyu/input/pages/user-guide'):
    if '_sources' in dirpath:
        continue

    for filename in [filename for filename in filenames if '.html' not in filename]:
        tmp = os.path.join(dirpath, filename)[2:].split('/')
        EXTRA_PATH_METADATA['/'.join(tmp[2:])] = {'path': '/'.join(tmp[3:])}
