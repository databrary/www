#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# PATHS
import os
import sys
sys.path.append(os.curdir)
sys.path.append(os.path.normpath(os.path.abspath(__file__)+'/../../'))

# CONFIG
from pelicanconf import *
from common.publishconf import *

# SITE
SITEURL = 'http://datavyu.org'

# FEEDS
FEED_DOMAIN = SITEURL
