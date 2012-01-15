# Copyright (c) 2012 Martin Ueding <dev@martin-ueding.de>

pythonfiles:=$(wildcard *.py)

epydoc: html/index.html

install:
	install multiimage $(DESTDIR)/usr/bin/multiimage

multiimage.png: multiimage.svg
	inkscape $< --export-png=$@ -w128 -h128

html/index.html: multiimage $(pythonfiles)
	epydoc $^

.PHONY: clean
clean:
	$(RM) *.pyc
	$(RM) multiimagec
	$(RM) -r html
