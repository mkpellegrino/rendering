#version 3.7;
global_settings{assumed_gamma 1.0}
#default{ finish{ ambient 0.1 diffuse 0.9 }}
#include "colors.inc"
#include "textures.inc"
#include "stones.inc"
#include "woods.inc"
#include "./track.inc"
#include "./table.inc"
#include "../fktr01.inc"
#include "../house.inc"
#include "../dog/dog.pov"
//#include "../lamp/makelamp.pov"

#declare BOT_MIDDLE_UP = 0;
#declare TOP_MIDDLE_turn_left = 3000;
#declare TOP_LEFT_down = 3930;
#declare BOT_LEFT_turn_left = 6930;
#declare BOT_MIDDLE_UP_2 = 7869;
#declare TOP_MIDDLE_turn_right = 10860;
#declare TOP_RIGHT_down = 11790;
#declare MID_RIGHT_down = 13290;
#declare BOT_RIGHT_turn_right = 14790;
#declare END_OF_TRACK = 15723;

#declare FOV = 75; //                        << Field of view angle in degrees

#declare starting_frame =  2800; //             <<===  CHANGE THIS IF YOU WANT TO START SOMEWHERE OTHER THAN AT THE BEGINNING


#declare one_fps = 30*clock + starting_frame;
#declare two_fps = 15*clock + starting_frame;
#declare ten_fps = 3*clock + starting_frame; // then total frames is 5241
#declare fifteen_fps = 2*clock + starting_frame;
#declare thirty_fps = clock + starting_frame;
#declare Random_1 = seed(1153);

// SETTINGS

// USE THIS TO RENDER FRAMES STARTING 
// AT SOMETHING OTHER THAN THE BEGINNING
#declare my_clock = fifteen_fps; //             <<===  CHANGE THIS IF YOU WANT A SPECIFIC FRAMES/SERCOND

// TEST_IMAGE
#declare TEST_IMAGE=0;

// do we want trees? 1=yes 0=no
#declare YES_TREES=0;

// do we just want a bird's eye view? 1=yes 0=no
#declare TOP_DOWN=0;

// turn text on or off
#declare TEXT_ON=0;












#if (TEXT_ON=1)
  text {
    ttf "/System/Library/Fonts/Keyboard.ttf" "Rendered with POV-Ray" 0.05, 0
    pigment { Black }
    scale 0.5
    translate <1, 0.25, 5>
  }
#end

// ======================================================================
// Add some mist in the scene to make it look like it's morning time
fog {distance 1000 color rgbt<0.7, 0.7, 0.7, 0.25> fog_type 2 fog_offset 5 fog_alt 4 turbulence 0.2 turb_depth 0.2 }
// ======================================================================

// ======================================================================
// This the light source (the Sun or some other star?)
//light_source{<0,0,0> color rgb<1,1,1> area_light <100,0,0><0,0,100> 10,10 adaptive 0 jitter translate<-50,100,0>}
light_source{<0,0,0> color rgb<1,1,1> area_light <100,0,0><0,0,100> 2,2 adaptive 1 jitter translate<-50,100,0>}
// ======================================================================

// ======================================================================
// This is the SKY
plane{<0,1,0>,1 hollow texture {pigment {bozo turbulence 0.92 color_map{[0.00 rgb<0.05,0.15,0.45>] [0.50 rgb<0.05,0.15,0.45>] [0.70 rgb<1,1,1>] [0.85 rgb<0.2,0.2,0.2>] [1.00 rgb<0.5,0.5,0.5> ]} scale<1,1,1.5>*2.5 translate<0,0,0> } finish{ambient 1 diffuse 0 reflection 0}} scale 5000}
// ======================================================================

// ======================================================================
// this is the GROUND
plane{<0,1,0>, 0.05 texture{pigment{color DarkGreen} normal{bumps 0.75 scale 0.2} finish{reflection 0 phong 0.05}}}
// ======================================================================


// Objects that are in the scene
object { Table texture { PinkAlabaster } scale .15 translate<-10,0,108>} 
//object { Lamp1 scale 0.04 translate <0,0,5>}
object {splitlevel scale 0.5 translate<3, 0, 130>} // add a house
object {splitlevel scale 0.5 rotate<0,90,0> translate<30, 0, 65>} // add a house
object { dog scale 0.05 rotate<0,225,0> translate<-17.1,0,97>  }


// lay out some track - 100 planks
#declare ITERATOR=0;
#while(ITERATOR<100)
  // this is the center straight track
  ctrPlank(0.02*rand(Random_1),0.01+0.01*rand(Random_1),ITERATOR,rand(Random_1)-0.5)
  // this is the far left straight track
  ctrPlank(-20+0.02*rand(Random_1),0.01+0.01*rand(Random_1),ITERATOR,rand(Random_1)-0.5)

#declare ITERATOR=ITERATOR+0.25;
#end

// this is the far right track
// it consistes of 2 hills
#declare ITERATOR=0;
#while(ITERATOR<50)
// create a hill with planks
  ctrPlank(20+0.02*rand(Random_1),  sin( pi*ITERATOR/50)*5 , ITERATOR,rand(Random_1)-0.5 )
  ctrPlank(20+0.02*rand(Random_1),  sin( pi*ITERATOR/50)*5 , ITERATOR+50,rand(Random_1)-0.5 )
#declare ITERATOR=ITERATOR+0.25;
#end

// create the u-turns in the track
// centered at (-10(x),100(z))
turn_track(-10,0.01,100,10,0,180,1.5)

// centered at (10,100) 
turn_track(10,0.01,100,10,0,180,1.5)

// centered at (-10,0 )
turn_track(-10,0.01,0,10,180,360,1.5)

// centered at (10,0)
turn_track(10,0.01,0,10,180,360,1.5)


// if we want to have trees rendered then place the trees in the scene
#if(YES_TREES=1)
#declare ITERATOR=0;
#while(ITERATOR<120)
// right side
object{treex07 rotate<0, rand(Random_1)*355,0>  scale (1+rand(Random_1)/10) translate<17+rand(Random_1),0,ITERATOR>}
object{treex01 rotate<0, rand(Random_1)*355,0> scale (1+rand(Random_1)/10) translate<23+rand(Random_1),0,ITERATOR>}

// Middle
object{treex01 rotate<0, rand(Random_1)*355,0>  scale (1+rand(Random_1)/10) translate<3+rand(Random_1),0,ITERATOR>}
object{treex03 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-3+rand(Random_1),0,ITERATOR> }
object{treex04 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-3+rand(Random_1),0,ITERATOR+14> }

// left side
object{treex05 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-23+rand(Random_1),0,ITERATOR> }
object{treex06 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-17+rand(Random_1),0,ITERATOR+3> }
#declare ITERATOR=ITERATOR+28;
#end // END WHILE
  
//object {treex01 translate <0,0,10> scale 0.25}
// put two trees to mark the start of the run
object{treex02 rotate<0, rand(Random_1)*355,0> scale .25  translate<-2,0,7>}
object{treex02 rotate<0, rand(Random_1)*37,0> scale .3  translate<2,0,7>}

object{treex05 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-17+rand(Random_1),0,97> }
object{treex07 rotate<0, rand(Random_1)*355,0> scale 0.35 translate<-17+rand(Random_1),0,71> }
object{treex08 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-17+rand(Random_1),0,10> }
object{treex08 rotate<0, rand(Random_1)*355,0> scale 0.25 translate<-18+rand(Random_1),0,-10> }
#end // END IF(YES_TREES=1)



// the bounce is to mimick how a camera would go up and down
// if it were held by a runner
#declare bounce = 0.1*sin(my_clock/(5*pi))*cos( my_clock/(4*pi) )+0.4;

// The base_line height of the camera from the ground
#declare eyelevel = 0.75;

//==================================================
#if( TEST_IMAGE=1 )
camera
  {
    location <0, eyelevel, 110>
    look_at <0,eyelevel,0>
    right x*image_width/image_height angle FOV
  }
//==================================================
#elseif( TOP_DOWN=1 )
  
  // we just want a view of the whole track
camera 
  {
    location <0, 150, 50>
    look_at <0,0,50>
    right x*image_width/image_height angle 50
  }
//#elseif(my_clock  15721 )

//==================================================
#elseif(my_clock > BOT_RIGHT_turn_right)
//                                                          fourth turn
//right turn at bottom (back to start from far right) 
#declare T=(pi/930)*(my_clock-BOT_RIGHT_turn_right);
camera{location <10*cos(T)+10, eyelevel+bounce, -10*sin(T) > 
#if( T > 900*(pi/930)*(my_clock-TOP_MIDDLE_turn_left) )
    look_at<0,eyelevel-0.25,3>
#else
    look_at<10+14.14*cos(T+pi/4), eyelevel, -14.14*sin(T+pi/4) > 
#end
  right x*image_width/image_height angle FOV} 
//==================================================
//                                                         second hill
#elseif(my_clock > MID_RIGHT_down)
// the right side hill - top to bottom
// this stretch is 1500 frames long
#declare T=(my_clock-MID_RIGHT_down)/15; 
camera{ location <20,0.5+eyelevel+bounce +  5*sin( pi*T/100),50-T/2>
look_at <20,eyelevel+ 5*sin( 0.02+pi*T/100),-T/2>
right x*image_width/image_height angle FOV}
//==================================================
//                                                         first hill
#elseif(my_clock > TOP_RIGHT_down)
// the right side hill - top to bottom
// this stretch is 1500 frames long
#declare T=(my_clock-TOP_RIGHT_down)/15; 
camera{ location <20,eyelevel+bounce +  5*sin( pi*T/100),100-T/2>
look_at <20,eyelevel+ 5*sin( 0.02+pi*T/100),50-T/2>
right x*image_width/image_height angle FOV}
//================================================== 
#elseif(my_clock > TOP_MIDDLE_turn_right)
//                                                         third turn (to the right)
#declare T= (pi/930)*(my_clock-TOP_MIDDLE_turn_right);
camera{location <10-10*cos(T), eyelevel+bounce, 100+10*sin(T) > 
#if( T > 900*(pi/930)*(my_clock-TOP_MIDDLE_turn_left) )
    look_at<10,eyelevel-0.25,97>
#else
    look_at<10-14.14*cos(T+pi/4), eyelevel, 100+14.14*sin(T+pi/4) > 
#end
  //look_at<10-10*cos(T+0.2), eyelevel, 100+10*sin(T+0.2) > 
  right x*image_width/image_height angle FOV} 
//==================================================
#elseif(my_clock > BOT_MIDDLE_UP_2 )
//                                                         the first sequence repeated
#declare T=(my_clock-BOT_MIDDLE_UP_2)/30;
camera{ location <0,eyelevel+bounce,T>
look_at <0,eyelevel,T + 3>
right x*image_width/image_height angle FOV}
//==================================================
#elseif(my_clock >= BOT_LEFT_turn_left )
//                                                         second turn (@ 6930)
#declare T=(pi/930)*(my_clock-BOT_LEFT_turn_left);
camera{location <-10 -10*cos(T), eyelevel+bounce, -10*sin(T) >

#if( T > 900*(pi/930)*(my_clock-TOP_MIDDLE_turn_left) )
      look_at<0,eyelevel-0.25,3>
#else
    look_at<-10-14.14*cos(T+pi/4), eyelevel, -14.14*sin(T+pi/4) > 
#end
  right x*image_width/image_height angle FOV}
//==================================================
#elseif(my_clock >= TOP_LEFT_down )
//                                                         coming down the left side (@ 3930)
#declare T=(my_clock-TOP_LEFT_down)/30; 
  camera{ location <-20,eyelevel+bounce,100-T>
  look_at <-20,eyelevel,97-T>  
right x*image_width/image_height angle FOV}
//==================================================
#elseif( my_clock >=  TOP_MIDDLE_turn_left )
//                                                         the first turn (@ 3000)
#declare T=(pi/930)*(my_clock-TOP_MIDDLE_turn_left);
  camera{location <-10 + 10*cos(T), eyelevel+bounce, 100+10*sin(T) >
  
    #if( T > 871*(pi/930)*(my_clock-TOP_MIDDLE_turn_left) )
      look_at<-20,eyelevel-0.25,97>
    #else
    //look_at<-10+14.14*cos(T+pi/4), eyelevel, 100+14.14*sin(T+pi/4) > 
    look_at<-10+10*cos(T+0.095855*pi), eyelevel, 100+10*sin(T+0.095855*pi) > 
    #end
  right x*image_width/image_height angle FOV}
  
  
  
//==================================================
#else
//                                                         the first stretch
#declare T=(my_clock-0)/30;
camera{ location <0,eyelevel+bounce,T>
#if (T>=97)
  look_at< -0.45*(1-(100-T)/3) , eyelevel, T+3 >
#else
  look_at<0, eyelevel, T+3>
#end
  right x*image_width/image_height angle FOV }
#end
//==================================================
