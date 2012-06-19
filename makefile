# Copyright (c) 2012 Martin Ueding <dev@martin-ueding.de>

###############################################################################
#                                   License                                   #
###############################################################################
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 2 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

pythonfiles:=$(wildcard *.py)

###############################################################################
#                               Public Targets                                #
###############################################################################

all: epydoc README.html

epydoc: html/index.html

install: multiimage.png
	install multiimage $(DESTDIR)/usr/bin/
	install -m 644 multiimage.desktop $(DESTDIR)/usr/share/applications/
	install -m 644 multiimage.png $(DESTDIR)/usr/share/pixmaps/

validate:
	desktop-file-validate multiimage.desktop

.PHONY: clean
clean:
	$(RM) *.html
	$(RM) *.pyc
	$(RM) -r html
	$(RM) multiimagec

###############################################################################
#                               Private Targets                               #
###############################################################################

html/index.html: multiimage $(pythonfiles)
	epydoc -v $^

multiimage.png: multiimage.svg
	inkscape $< --export-png=$@ -w128 -h128

README.html: README.markdown
	pandoc -s $< -o $@
