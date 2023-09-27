render:
	povray middleearth

tiny:
	povray tiny

video24:
	ffmpeg -framerate 24 -i tiny%03d.png -q 0 -vcodec mpeg4 tiny.mp4
