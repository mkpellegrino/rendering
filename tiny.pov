#version 3.7;
global_settings{assumed_gamma 1.0}
#default{ finish{ ambient 0.1 diffuse 0.9 }}
//#include "math.inc"
#include "functions.inc"
#include "colors.inc"
#include "textures.inc"
#include "woodmaps.inc"
#include "woods.inc"
#include "glass.inc"

#include "../fktr01.inc"

#include "colors.inc"
#include "terrains.inc"
#declare Random_1 = seed (1151);


#declare ele=function {  pigment { image_map {png "tiny-dem.png" gamma 1.0  interpolate 2} rotate<90,0,0> scale < 400, 1, 400 >}  }

  
//camera{ location<175, 3, 0> look_at<175,0,210> angle 2.5 }
camera{ location<50, 10, -50> look_at<-201,10,201> angle 30 }
//camera{ location<0, 100, 0> look_at<0,0,0> angle 30 }


light_source{<0,100,10> color rgb<0.9,0.8,0.7> area_light <5,0,0><0,0,5> 5,5 adaptive 1 }

// ======================================================================
// this is the SKY
plane{<0,1,0>,1 hollow texture {pigment {bozo turbulence 0.92 color_map{[0.00 rgb<0.05,0.15,0.45>] [0.50 rgb<0.05,0.15,0.45>] [0.70 rgb<1,1,1>] [0.85 rgb<0.2,0.2,0.2>] [1.00 rgb<0.5,0.5,0.5> ]} scale<1,1,1.5>*2.5 translate<0,300,0> } finish{ambient 1 diffuse 0 reflection 0}} scale 1000}

// ======================================================================
// this is the GROUND
//plane{<0,1,0>, 0.05 texture{pigment{color Tan} normal{bumps 0.75 scale 0.2} finish{reflection 0 phong 0.05}} scale 0.01}
// ======================================================================
  
// ground ----------------------------------
//plane{ <0,1,0>, 0
//       texture{
//          pigment{ color rgb<0.22,0.45,0>}
//          normal { bumps 0.75 scale 0.015 }
//          finish { phong 0.1 }
 //       } // end of texture
//     } // end of plane



// ======================================================================
// Add some mist in the scene to make it look like it's morning time
//fog {distance 1000 color rgbt<0.7, 0.7, 0.7, 0.25> fog_type 2 fog_offset 5 fog_alt 4 turbulence 0.2 turb_depth 0.2 }
// ======================================================================


//height_field { png "tiny-dem.png"  pigment{ color rgb<0.22,0.45,0>}  scale <400, 10, 400> translate<-200,0,-200> }

height_field { png "tiny-dem.png"  smooth pigment{ color rgb<0.22,0.45,0>} normal { bumps 0.75 scale 0.015 } texture{ pigment{ color rgb<0.22,0.45,0>} normal { bumps 0.75 scale 0.015 } finish { phong 0.1 } } scale <400, 40, 400> translate<-200,0,-200> }


#declare J=0;
#while( J<=400 )
  #declare K=0;
  #while( K<=400 )    
    #declare H =  ele( J, 0, K ).gray;
    #declare JITTERX = rand(Random_1)*4-2;
    #declare JITTERZ = rand(Random_1)*4-2;
    #if( H > 0 )
      #declare B = 1;
    #else
      #declare B = 0;
    #end
    
    #if( H > .9 )
      #declare G = 1;
      #declare B = 0;
    #else
      #declare G = 0;
      #declare B = 1;
    #end
    
    
    #declare CHOOSER = rand(Random_1)*2;
    
    #if( CHOOSER > 1 )
      object{treex05 rotate y*rand(Random_1)*355  scale (0.1) translate <J-200+JITTERX,H*40, K-200+JITTERZ>   }
    #else
      object{treex07 rotate y*rand(Random_1)*355  scale (0.1) translate <J-200+JITTERX,H*40, K-200+JITTERZ>   }
    #end
    
   // box{ <-0.5, 0, -0.5> <0.5, 1, 0.5> translate <J-200+JITTERX,H*40, K-200+JITTERZ> pigment{ color rgb<1,G,B>} }
  #declare K=K+1;  
  #end
  #declare J=J+1;
#end // while (K <= 10)
