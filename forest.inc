#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "woods.inc"

// ======================================================================
// These functions are for the turning of the camera while looking at a specific point
// that is a specified distance away on the z-axis (so that the 'bouce' is correct
// and consistant all the way through
#declare get_angle = function( r, d ) { acos( 1 - (d*d)/(2*r*r) ) };
#declare circle_eyesX = function(center_X, center_Y, my_radius, my_angle, my_distance, which_wise ) { center_X + my_radius*cos(my_angle+which_wise*get_angle(my_radius, my_distance)) };
#declare circle_eyesY = function(center_X, center_Y, my_radius, my_angle, my_distance, which_wise ){center_Y + my_radius*sin(my_angle+which_wise*get_angle(my_radius, my_distance))};
#declare circle_placementX = function(center_X, center_Y, my_radius, my_angle ){center_X + my_radius*cos(my_angle)};
#declare circle_placementY = function(center_X, center_Y, my_radius, my_angle ){center_Y + my_radius*sin(my_angle)};
#declare get_altitude = function( T ){-1*cos( T ) + 1}; // T is theta (from 0 to 2pi)
  
#macro create_forest( a, b, w, h, d )
    #declare I=0;
#while( I<=w )
  #declare J=0;
  #while( J<=w )
    
    #if( rand( Random_1 ) > d )
      #declare s1=4*rand(Random_1)-2;
      #declare s2=4*rand(Random_1)-2;
      #declare s3=1+rand(Random_1);
      #declare t1=5*rand(Random_1);
      #if( t1>4 )
	object{treex05 rotate<0, rand(Random_1)*345,0> scale s3 translate<a + 8*I - w/2 + s1,-0.01,7.5*J - h/2 + s2 + b>}
      #elseif( t1>3 )
	object{treex02 rotate<0, rand(Random_1)*345,0> scale s3 translate<a + 8*I - w/2 + s1,-0.01,7.5*J - h/2 + s2 + b>}
	#elseif( t1>2 )
	object{treex01 rotate<0, rand(Random_1)*345,0> scale s3 translate<a + 8*I - w/2 + s1,-0.01,7.5*J - h/2 + s2 + b>}
	#elseif( t1>1 )
	object{treex03 rotate<0, rand(Random_1)*345,0> scale s3 translate<a + 8*I - w/2 + s1,-0.01,7.5*J - h/2 + s2 + b>}
	#elseif( t1>0 )
	object{treex04 rotate<0, rand(Random_1)*345,0> scale s3 translate<a + 8*I - w/2 + s1,-0.01,7.5*J - h/2 + s2 + b>}
	#end
    #end
    
  #declare J=J+1;  
  #end // while (J<40)
  #declare I=I+1;
#end // while (I<40 )
#end // macro