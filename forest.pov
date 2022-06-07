#version 3.7;
global_settings{assumed_gamma 1.0}
#default{ finish{ ambient 0.1 diffuse 0.9 }}
#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "woods.inc"
#include "./forest.inc"
#include "../fktr01.inc"

#if( clock = 0)
  #warning "New Render"
#warning datetime(now)
  #warning "============================================="
#end

#declare LOOK_AHEAD_DISTANCE = 3;

#declare FOV = 75; //                          <<=== Field of view angle in degrees
#declare eyelevel = 0.75;

#declare Random_1 = seed(1153);


// TEST_IMAGE
#declare TEST_IMAGE=1;

// do we want trees? 1=yes 0=no
#declare YES_TREES=1;

// do we just want a bird's eye view? 1=yes 0=no
#declare TOP_DOWN=0;


// ======================================================================
// Add some mist in the scene to make it look like it's morning time
fog {distance 1000 color rgbt<0.7, 0.7, 0.7, 0.25> fog_type 2 fog_offset 5 fog_alt 4 turbulence 0.2 turb_depth 0.2 }
// ======================================================================

// ======================================================================
// This the light source (the Sun or some other star?)
//light_source{<0,0,0> color rgb<1,1,1> area_light <100,0,0><0,0,100> 10,10 adaptive 0 jitter translate<-50,100,0>}
//light_source{<0,0,0> color rgb<1,1,1> area_light <50,0,0><0,0,50> 10,10 adaptive 1 jitter translate<-50,100,0>}
light_source{<0,0,0> color rgb<1,1,1> area_light <50,0,0><0,0,50> 10,10 adaptive 1 translate<-50,100,0>}
// ======================================================================

// ======================================================================
// This is the SKY
plane{<0,1,0>,1 hollow texture {pigment {bozo turbulence 0.92 color_map{[0.00 rgb<0.05,0.15,0.45>] [0.50 rgb<0.05,0.15,0.45>] [0.70 rgb<1,1,1>] [0.85 rgb<0.2,0.2,0.2>] [1.00 rgb<0.5,0.5,0.5> ]} scale<1,1,1.5>*2.5 translate<0,0,0> } finish{ambient 1 diffuse 0 reflection 0}} scale 5000}
// ======================================================================

// ======================================================================
// this is the GROUND
plane{<0,1,0>, 0.05 texture{pigment{color DarkGreen} normal{bumps 0.75 scale 0.2} finish{reflection 0 phong 0.05}}}
// ======================================================================


// if we want to have trees rendered then place the trees in the scene
#if(YES_TREES=1)

create_forest( 0, 0, 50, 50, 0.92 )
  
//#declare ITERATOR=0;
//#while(ITERATOR<120)
// right side
//object{treex07 rotate<0, rand(Random_1)*355,0>  scale (2+rand(Random_1)/10) translate<15+rand(Random_1),-0.001,ITERATOR>}
//object{treex01 rotate<0, rand(Random_1)*355,0> scale (2+rand(Random_1)/10) translate<25+rand(Random_1),-0.001,ITERATOR>}

// Middle
//object{treex01 rotate<0, rand(Random_1)*355,0>  scale (1+rand(Random_1)/10) translate<3+rand(Random_1),-0.001,ITERATOR>}
//object{treex03 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-3+rand(Random_1),-0.001,ITERATOR> }
//object{treex04 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-3+rand(Random_1),-0.001,ITERATOR+14> }

// left side
//object{treex05 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-23+rand(Random_1),-0.001,ITERATOR> }
//object{treex06 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-17+rand(Random_1),-0.001,ITERATOR+3> }
//#declare ITERATOR=ITERATOR+28;
//#end // END WHILE
  
//object {treex01 translate <0,0,10> scale 0.25}
// put two trees to mark the start of the run
//object{treex02 rotate<0, rand(Random_1)*355,0> scale .25  translate<-2,-0.001,7>}
//object{treex02 rotate<0, rand(Random_1)*37,0> scale .3  translate<2,-0.001,7>}

//object{treex05 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-17+rand(Random_1),-0.001,97> }
//object{treex07 rotate<0, rand(Random_1)*355,0> scale 0.35 translate<-17+rand(Random_1),-0.001,71> }
//object{treex08 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-17+rand(Random_1),-0.001,10> }
//object{treex08 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-18+rand(Random_1),-0.001,-10> }
#end // END IF(YES_TREES=1)








//==================================================
#if( TEST_IMAGE=1 )
camera
  {
    // an alternate view
    location <-50, 40,-50>
    look_at <50,1,50>
    right x*image_width/image_height angle FOV
  }
//==================================================
#elseif( TOP_DOWN=1 )
    // we just want a view of the whole scene
camera 
  {
    location <0, 50, 0>
    look_at <0,0,0>
    right x*image_width/image_height angle FOV
  }
#else
camera
  { 
  location <0,eyelevel,0>
  look_at<0, eyelevel, LOOK_AHEAD_DISTANCE>
  right x*image_width/image_height angle FOV 
}
#end
  
