#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# PATHS
import os
import sys
sys.path.append(os.curdir)
sys.path.append(os.path.normpath(os.path.abspath(__file__)+'/../../'))

# CONFIG
from common.pelicanconf import *

# SITE
SITENAME = 'Datavyu: Video coding and data visualization tool'
SITESLUG = 'datavyu'

# COMPILE
OUTPUT_RETENTION = ('maven2', 'releases', 'support')

STATIC_PATHS.extend([
	'releases',
	'pages/user-guide/.buildinfo',
	'pages/user-guide/objects.inv',
	'pages/user-guide/searchindex.js',
	'pages/user-guide/_downloads',
	'pages/user-guide/_images',
	'pages/user-guide/_sources',
	'pages/user-guide/_static',
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
        EXTRA_PATH_METADATA['/'.join(tmp[2:])] = {'path': '/'.join(tmp[4:])}