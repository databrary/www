# -*- coding: utf-8 -*-

"""
DATAVYU RELEASES
-------

This plugin replaces %%datavyu%% codes with up-to-date releases from repo datavyu/version.txt
"""

from __future__ import unicode_literals

import re

from pelican import signals
from pelican import contents
from pelican.utils import pelican_open

from pprint import pprint


def version_replacement(instance):
	patterns = {
		'../datavyu/version.txt': r'%%datavyu-version%%',
		'../datavyu/pre_version.txt': r'%%datavyu-version-pre%%',
	}

	for filename, pattern in patterns.items():
		if 'download.md' in instance.source_path and re.search(pattern, instance._content):
			with pelican_open(filename) as txt:
				instance._content = re.sub(pattern, txt.split()[0], instance._content)


def register():
	signals.content_object_init.connect(version_replacement)