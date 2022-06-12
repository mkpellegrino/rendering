// Michael K. Pellegrino
// June 12, 2014
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