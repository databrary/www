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
TOPRIGHT_TARGET1 = 'https://nyu.databrary.org/user/register'
TOPRIGHT_TEXT1   = 'register'
TOPRIGHT_TARGET2 = 'https://nyu.databrary.org/user/login'
TOPRIGHT_TEXT2 = 'login'

# COMPILE
OUTPUT_RETENTION = ('irclogs', 'policies', 'awstats', 'awstats.cgi', 'bugs')
PAGINATION_PATTERNS = (
  (1, '{base_name}/news.html', '{base_name}/news.html'),
  (2, '{base_name}/news{number}.html', '{base_name}/news{number}.html'),
)

STATIC_PATHS.extend([
	'policies',
	'internal'
])
