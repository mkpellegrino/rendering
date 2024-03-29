// twodline
// By: Michael K. Pellegrino
// 2022 06 12
// Draws a line using POVRay's SDL.
// and ... in case you're wondering
// it's "two-d" (as in 2 dimensional)
// ... not "twod" -- and yes yes yes
// i know - it's not really 2-D
#include "colors.inc"
#declare twod_debug=1;


#declare additionalXY = function(a)
{
  select( a, 90, 0 )
}

#declare additionalXZ = function(a)
{
 
  select( a, 180, 0 )
}

#declare angle_on_XY = function( x1, y1, z1, x2, y2, z2)
{
  atan2((y2-y1), (x2-x1))*180/pi
}

#declare angle_on_XZ = function(x1, y1, z1, x2, y2, z2 ) 
{ 
  additionalXZ(x2-x1)+atan2((z2-z1), (x2-x1))*180/pi
}

#declare angle_on_YZ = function(x1, y1, z1, x2, y2, z2 ) { atan2( (z2-z1),(y2-y1) )*180/pi } // angle for x-axis

#macro twodline( x1, y1, z1, x2, y2, z2 )
#declare twod_thickness = 0.02;
#if( twod_debug = 1 )
  
	#warning concat( "\nP1 <", str(x1,5,0), ", ", str(y1, 5, 0), ", ", str(z1,5,0), ">" )
	#warning concat( "P2 <", str(x2,5,0), ", ", str(y2, 5, 0), ", ", str(z2,5,0), ">" )	
	#warning concat( "Thickness: ", str( twod_thickness,5,0))
	#warning concat( "Angle on XY: ", str( angle_on_XY(x1, y1, z1, x2, y2, z2 ), 0, 3 ))
	#warning concat( "Angle on XZ: ", str( angle_on_XZ(x1, y1, z1, x2, y2, z2 ), 0, 3 ))
	#warning concat( "Angle on YZ: ", str( angle_on_YZ(x1, y1, z1, x2, y2, z2 ), 0, 3 ), "( not used )\n")
#end // end if
  
      box
      { 
	<0, -(twod_thickness/2), -(twod_thickness/2) >
	<sqrt( (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2) + (z1-z2)*(z1-z2) ), twod_thickness/2, twod_thickness/2 >
	texture 
	{ 
	  pigment
	  { color Black }
	  finish { diffuse 0.5 phong 0.25 }
	}
	rotate <0, 0, angle_on_XY(x1, y1, z1, x2, y2, z2 )>
	rotate <0, -angle_on_XZ(x1, y1, z1, x2, y2, z2 ), 0>
	translate<x1,y1,z1>
      } 
#end // end macro
  