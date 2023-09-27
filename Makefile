render:
	povray middleearth

tiny:
	povray tiny

video24:
	ffmpeg -framerate 24 -i middleearth%03d.png -q 0 -vcodec mpeg4 middleearth.mp4
