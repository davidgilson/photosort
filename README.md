# Photosort
## A photo organising script


**Requirements**:

- [ImageMagik](http://www.imagemagick.org/)
- Any GNU BASH shell, e.g. Linux, OSX, or [Cygwin](https://www.cygwin.com/) for Windows

## Introduction

This BASH script will scan a directory, which is assumed to contain images. *It will also work with some MP4 files*. It will then attempt to read their EXIF data for the date that the original photo was taken. It will then create directories based on the dates it files and will move the respective images into that directory.

If there is no `DateTimeOriginal` tag, then the script will attempt to read the `date:modify` tag. If neither of those approaches work, it will put the image into a directory called "`unknown/`".

Once a set of directories of the form `YYYY-MM-DD` has been created, a directory tree with the pattern, `YYYY/MM/` will be created and the original set of directories will be assigned corresponding parents.

The result will be a directory tree of the form: `YYYY/MM/YYYY-MM-DD/*.*`

## Usage
The assumed usage for this script is that you will have a folder of incoming photos, e.g. the camera roll folder for Dropbox or OneDrive; or even a download folder for files copied from a digital camera. 

The script should **not** be in the same directory as the photos. It is better to add it to your HOME directory and either use the absolute path, or add it to your Path environmental variable.

The script does not know where you store your photos, so you will have to move the resulting directory tree to your photo archive.

*Example*

> `cd ~`
> 
> `chmod +x photosort.sh`
> 
> `cd ~/Dropbox/Camera\ Uploads`
> 
> `~/./photosort.sh`
> 
> `mv 2014/ ~/Photos/`

*Warning: This script should not be used in directories that do not contain photos of videos.*

*I am not responsible for any loss of data incurred by using this script*
