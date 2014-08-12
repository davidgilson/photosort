# Photosort
## A photo organising script


**Requirements**:

- [ImageMagik](http://www.imagemagick.org/)
- Any GNU BASH shell, e.g. Linux, OSX, or [Cygwin](https://www.cygwin.com/) for Windows

This BASH script will scan a directory, which is assumed to contain images. *It will also work with some MP4 files*. It will then attempt to read their EXIF data for the date that the original photo was taken. It will then create directories based on the dates it files and will move the respective images into that directory.

If there is no `DateTimeOriginal` tag, then the script will attempt to read the `date:modify` tag. If neither of those approaches work, it will put the image into a directory called "`unknown/`".

Once a set of directories of the form `YYYY-MM-DD` has been created, a directory tree with the pattern, `YYYY/MM/` will be created and the original set of directories will be assigned corresponding parents.

The result will be a directory tree of the form: `YYYY/MM/YYYY-MM-DD/*.*`

*Warning: This script should not be used in directories that do not contain photos of videos.*

*I am not responsible for any loss of data incurred by using this script*
