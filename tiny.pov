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

#declare IMGSZ = 800;
#declare SCALING = 1;

#declare FANCY = 0;

#declare ele=function { pigment { image_map {png "tiny-dem.png" interpolate 2} rotate<90,0,0> scale <IMGSZ*SCALING,1,IMGSZ*SCALING>} }

#declare HT=function( X, Y ) 
{
  ( ele(X,0,Y).gray + ele(X+1,0,Y).gray + ele(X+1,0,Y+1).gray + ele(X+1,0,Y-1).gray + ele(X-1,0,Y).gray + ele(X-1,0,Y+1).gray + ele(X-1,0,Y-1).gray + ele(X,0,Y+1).gray + ele(X,0,Y-1).gray ) / 9
}

  
  //#declare ele=function { pigment {     image_map {png "me-dem2.png" interpolate 2 } } }



//camera{ location<175, 3, 0> look_at<175,0,210> angle 2.5 }
camera{ location<200, 10, 0> look_at<200,10,10> angle 120 }
//camera{ location<0, 100, 0> look_at<0,0,0> angle 120 }


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


height_field { png "tiny-dem.png"  smooth pigment{ color rgb<0.22,0.45,0>} normal { bumps 0.75 scale 0.015 } texture{ pigment{ color rgb<0.22,0.45,0>} normal { bumps 0.75 scale 0.015 } finish { phong 0.1 } } scale <400, 10, 400> translate<-200,0,-200> }






#declare J=0;
#while( J<=IMGSZ*SCALING )
  
  #declare K=0;
  #while( K<=IMGSZ*SCALING )
    //#debug concat( str(ele(J,0,K).gray, 4, 4), " " )
    //object{treex07 rotate<0, rand(Random_1)*355,0>  scale (0.5) translate<J,ele(J/10,K/10,0).gray,K>}
    // box{ <-0.5, 0, -0.5> <0.5, 1, 0.5> translate<J, ele(J,K,0).gray*40, K> pigment{ color rgb<1,0,0>} }
    //box{ <-0.5, 0, -0.5> <0.5, 1, 0.5> translate <K-100,ele(J,K,0).gray*40, J-100> pigment{ color rgb<1,0,0>} }

    
    #if( FANCY = 1 )
      // if we're on an intersection of the grid
      #if( J = int(J/IMGSZ) & K/IMGSZ = int(K/IMGSZ))
	#declare H = ( ele( J, 0, K ).gray + ele( J, 0, K ).gray ) / 2;
      #else
	#if(J/IMGSZ = int(J/IMGSZ))
	  #declare H = ( ele( J, 0, floor(K) ).gray + ele( J, 0, ceil(K) ).gray )/2;
	#else
	  #if(K/IMGSZ = int(K/IMGSZ))
	    #declare H = ( ele( J, 0, int(K) ).gray + ele( J, 0, int(K)+1 ).gray )/2;
	  #else
	    #declare H = ( ele(J,0,K+1).gray + ele(J,0,K-1).gray + ele(J+1,0,K+1).gray + ele(J+1,0,K-1).gray + ele(J-1,0,K+1).gray + ele(J-1,0,K-1).gray + ele(J+1,0,K).gray + ele(J-1,0,K).gray ) / 8;
	  #end// }
	#end // }
      #end // }
      
      
    #else  // If Fancy
      #declare H =  ele( J, 0, int(K) ).gray;
      //#declare H = HT( J, K );
      #if( H < 0.25 )
	#declare H = H * 2;
      #end
      #if( H < 0.5 )
	#declare H = H * 2;
      #end
    #end
    
    #declare JITTERX = rand(Random_1)-0.5;
    #declare JITTERZ = rand(Random_1)-0.5;
    #declare CHOOSER = rand(Random_1)*2;
    
    //box{ <-0.5, 0, -0.5> <0.5, 1, 0.5> translate <J-100+JITTERX,H*10+1, K-100+JITTERZ> pigment{ color rgb<1,0,0>} }
    #if( CHOOSER > 1 )
      object{treex05 rotate y*rand(Random_1)*355  scale (0.1) translate <J-(IMGSZ/2)+JITTERX,(H*10), K-(IMGSZ/2)+JITTERZ>   }
    #else
      object{treex07 rotate y*rand(Random_1)*355  scale (0.1) translate <J-(IMGSZ/2)+JITTERX,(H*10), K-(IMGSZ/2)+JITTERZ>   }
    #end
    #declare K=K+3;  
  #end // while (K <= 10)
  #declare J=J+3;
#end // while( J <= 10)