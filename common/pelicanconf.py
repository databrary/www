#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

import re
import datetime


# LOCAL
TIMEZONE = 'America/New_York'
DEFAULT_LANG = 'en'


# SITE
AUTHOR = 'The Databrary Team'


# CONTENT
USE_FOLDER_AS_CATEGORY = False
DEFAULT_CATEGORY = 'news'
DEFAULT_DATE_FORMAT = '%B %d, %Y'
DEFAULT_METADATA = (('order', '10000'),)

FILENAME_METADATA = '^(?P<date>\d{4}-\d{2}-\d{2})[-_](?P<slug>.*)$'
PATH_METADATA = '^pages/(?P<slug>.*)\.[a-z]*$'

SUMMARY_MAX_LENGTH = 50
DEFAULT_PAGINATION =  7
DEFAULT_ORPHANS = 0

PLUGIN_PATHS = ['../common/plugins']
PLUGINS = ['sitemap', 'mdimport', 'vyu_releases', 'pagetree']
MD_EXTENSIONS = ['codehilite(css_class=highlight)', 'extra', 'admonition', 'headerid(level=2)']

SITEMAP = {
	'format': 'xml',
	'priorities': {'articles': 0.75, 'indexes': 0.5, 'pages': 1},
	'changefreqs': {'articles': 'monthly', 'indexes': 'daily', 'pages': 'monthly'},
}


# COMPILE
THEME = '../common/theme'
DELETE_OUTPUT_DIRECTORY = False

PATH = 'input/'
OUTPUT_PATH = 'output/'
DIRECT_TEMPLATES = ('index',)
PAGINATED_DIRECT_TEMPLATES = ('index',)

PAGE_PATHS = ['pages']
PAGE_EXCLUDES = []
ARTICLE_PATHS = ['posts']
ARTICLE_EXCLUDES = []
STATIC_PATHS = ['files', 'img', 'ico', 'js', 'css', 'extra', 'video', '.htaccess', 'favicon.ico','contact.html','newsletter.html','CNAME']

TYPOGRIFY = False
PYGMENTS_RST_OPTIONS = {'classprefix': 'highlight', 'linenos': 'table'}

# JINJA
def sphinx_element(value, element):
	try:
		out = re.search(re.compile("<" + element + ">(.*)</" + element + ">", re.DOTALL), value).group(1)
	except Exception:
		out = value

	return out


def future_date(iterable):
	now = datetime.datetime.now(datetime.timezone.utc)

	iterable = [post for post in iterable if post.date >= now]

	return iterable


def recent_date(iterable, days=30):
	now = datetime.datetime.now(datetime.timezone.utc)
	past = now - datetime.timedelta(days=days)

	iterable = [post for post in iterable if now >= post.date >= past]

	return iterable


JINJA_FILTERS = {
	'sphinx': sphinx_element,
	'future': future_date,
	'recent': recent_date,
}


# URLS
ARTICLE_URL = 'post/{slug}.html'
ARTICLE_SAVE_AS = 'post/{slug}.html'

PAGE_URL = '{slug}.html'
PAGE_SAVE_AS = '{slug}.html'

ARCHIVES_SAVE_AS = 'archives.html'

CATEGORY_SAVE_AS = False
CATEGORIES_SAVE_AS = False

TAG_SAVE_AS = False
TAGS_SAVE_AS = False

AUTHOR_SAVE_AS = False
AUTHORS_SAVE_AS = False

PAGE_ORDER_BY = 'order'
ARTICLE_ORDER_BY = 'reversed-date'

# FEEDS
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
FEED_MAX_ITEMS = 25


# CUSTOM
PROJECTS = (
	('Databrary', 'http://databrary.org:8001'),
	('Datavyu', 'http://datavyu.org:8002'),
)
