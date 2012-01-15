# Copyright (c) 2012 Martin Ueding <dev@martin-ueding.de>

pythonfiles:=$(wildcard *.py)

epydoc: html/index.html

html/index.html: multiimage $(pythonfiles)
	epydoc $<

.PHONY: clean
clean:
	$(RM) *.pyc
	$(RM) multiimagec
	$(RM) -r html
