# Copyright (c) 2012 Martin Ueding <dev@martin-ueding.de>

pythonfiles:=$(wildcard *.py)

epydoc: html/index.html

install: multiimage.png
	install multiimage $(DESTDIR)/usr/bin/
	install multiimage.desktop $(DESTDIR)/usr/share/applications/
	install multiimage.png $(DESTDIR)/usr/share/pixmaps/

multiimage.png: multiimage.svg
	inkscape $< --export-png=$@ -w128 -h128

html/index.html: multiimage $(pythonfiles)
	epydoc $^

.PHONY: clean
clean:
	$(RM) *.pyc
	$(RM) multiimagec
	$(RM) -r html
