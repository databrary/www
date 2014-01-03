# -*- coding: utf-8 -*-
"""
MARKDOWN IMPORT
-------

The mdimport plugin wraps regular markdown files with metadata.
"""

from __future__ import unicode_literals

import re
import itertools

try:
	from markdown import Markdown
except ImportError:
	Markdown = False

from pelican import signals
from pelican.readers import MarkdownReader
from pelican.utils import pelican_open


class MarkdownImportReader(MarkdownReader):
	"""Reader for Markdown Import Files.

	Files require, at minimum the following metadata:

	Title: TITLE
	Source: RELATIVE_SOURCE

	Content is not read.
	Source metadata stripped.
	"""

	file_extensions = ['mdi']

	def read(self, filename):
		"""Parse content and metadata of markdown files"""

		self._md = Markdown(extensions=self.extensions)

		with pelican_open(filename) as mdi:
			with pelican_open(re.search(r"Source: ([\w/\\\.-]*)", mdi).group(1)) as md:
				content = self._md.convert(mdi+"\n"+re.sub(r"([A-Z][\w-]*): (.*)", r"", md))

		metadata = self._parse_metadata(self._md.Meta)
		return content, metadata


def add_reader(readers):
	readers.reader_classes['mdi'] = MarkdownImportReader


def register():
	signals.readers_init.connect(add_reader)
