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
SITENAME = 'Databrary: An Open Data Library for Developmental Science'
SITESLUG = 'databrary'
TOPRIGHT_TARGET = 'https://nyu.databrary.org/'
TOPRIGHT_TEXT   = 'enter databrary beta'

# COMPILE
OUTPUT_RETENTION = ('irclogs', 'policies', 'awstats', 'awstats.cgi', 'bugs')

STATIC_PATHS.extend([
	'policies',
	'internal'
])
