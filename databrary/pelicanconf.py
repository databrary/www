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
TOPRIGHT_TARGET1 = 'https://nyu.databrary.org/register'
TOPRIGHT_TEXT1   = 'register'
TOPRIGHT_TARGET2 = 'https://nyu.databrary.org/login'
TOPRIGHT_TEXT2 = 'sign in'

# COMPILE
OUTPUT_RETENTION = ('irclogs', 'policies', 'awstats', 'awstats.cgi', 'bugs')

STATIC_PATHS.extend([
	'policies',
	'internal'
])
