#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# PATHS
import os
import sys
sys.path.append(os.curdir)
sys.path.append(os.path.abspath(__file__)+'/../../')

# CONFIG
from common.pelicanconf import *

# SITE
SITENAME = 'Datavyu: Video coding and data visualization tool'
SITESLUG = 'datavyu'

# COMPILE
OUTPUT_RETENTION = ('maven2', 'releases', 'support')

STATIC_PATHS.append('releases')

TEMPLATE_PAGES = {'../../../datavyu/version.txt': 'version.txt',
                  '../../../datavyu/pre_version.txt': 'pre_version.txt'}
