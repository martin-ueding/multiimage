# Copyright (c) 2012 Martin Ueding <dev@martin-ueding.de>

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
	$(RM) *.pyc
	$(RM) multiimagec
	$(RM) -r html

###############################################################################
#                               Private Targets                               #
###############################################################################

html/index.html: multiimage $(pythonfiles)
	epydoc -v $^

multiimage.png: multiimage.svg
	inkscape $< --export-png=$@ -w128 -h128

README.html: README.markdown
	pandoc -s $< -o $@
