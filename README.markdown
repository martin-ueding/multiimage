# multiimage

A lot of my scanned images are plain JPEG files. When I have a multiple page document, it will become multiple images.

One could join them into a single PDF file, but I'd rather have the original files since images in PDF usually look blurrier. With text, it makes it harder to read.

Browsing through multiple images is not a problem with programs like *Gwenview* or *Eye of Gnome*. The only thing is that they display them fitting to the window. If you zoom, they will center. This might be natural for pictures, but not for a document.

Opening a single picture in *Okular* yields what I need: Fit to page width, starting at the top of the image. Unfortunately, *Okular* does not support multiple image files, and that is [not going to change](http://bugs.kde.org/show_bug.cgi?id=183102) either.

This is a little script that generates a HTML page which combines all those images. A web browser starts at the top of the screen and is able to fit images to width of the window.

## usage

There are two ways to use this program.

### single filename

Call it with a single image file.

	multiimage physik111-03-korrigiert+2.jpg

It assumes that your images are numbered like this:

	physik111-03-korrigiert+1.jpg
	physik111-03-korrigiert+2.jpg
	physik111-03-korrigiert+3.jpg
	physik111-03-korrigiert+4.jpg
	physik111-03-korrigiert+5.jpg
	physik111-03-korrigiert+6.jpg

They have to have the exact same name, just differ by the number behind the `+` sign.

### multiple filenames

No matter how your images are named, *multiimage* will display them in the order you specify on the command line.

	multiimage physik111-03-korrigiert+1.jpg physik111-03-korrigiert+2.jpg physik111-03-korrigiert+3.jpg ...

## see also

[my blog post about this](http://www.martin-ueding.de/site/120115-multiimage.html)
