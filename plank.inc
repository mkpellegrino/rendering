#include "colors.inc"
#include "textures.inc"
#include "woods.inc"

// ======================================================================
// This is the track plank definition
// Px = Center x
// Py = Center y
// Pz = Center z
// Pr = rotation
#macro ctrPlank( Px, Py, Pz, Pr )
box
  {
    // bottom left corner
    <-1,0,-0.1>,
    // top right corner
    < 1,0.1,0.1>
    texture
    {
      pigment
      {
	DMFDarkOak
	scale 0.5
	rotate y*90
	// add a little bit of random
	// spin to make it not-so-uniform
	rotate x*(int(80*rand(Random_1))+5)
      } // end pigment
      finish
      { 
	phong 0.05 diffuse .5 ambient .2 reflection 0 
      } // end finish
    }  // end texture
    rotate<0,Pr,0> translate<Px,Py,Pz>
  } // end box
#end // end macro

// ======================================================================
// This macro will create a turn in the track
// ttx = where the center of the rotation is (X)
// tty = the height off of the ground
// ttz = where the center of the rotation is (Z)
// ttr = radius of turn
// ttSTART = where on the unit circle the turn starts
// ttFINISH = where on the unit circle the turn ends
// ttStep = how much rotation ber plank (1.5 seems to work well)
#macro turn_track(ttx,tty,ttz,ttr,ttSTART,ttFINISH,ttStep)
#if(ttSTART<ttFINISH)
#declare ITERATOR=ttSTART;
#while(ITERATOR<=ttFINISH)
ctrPlank(ttx+cos(ITERATOR*pi/180)*ttr,tty,ttz+sin(ITERATOR*pi/180)*ttr,-ITERATOR)
  
#declare ITERATOR=ITERATOR+ttStep;
#end
#end
#if(ttSTART>ttFINISH)
#declare ITERATOR=ttSTART;
#while(ITERATOR>=ttFINISH)
ctrPlank(ttx+cos(ITERATOR*pi/180)*ttr,tty,ttz+sin(ITERATOR*pi/180)*ttr,-ITERATOR)
#declare ITERATOR=ITERATOR-ttStep;
#end
#end
#end
// ======================================================================