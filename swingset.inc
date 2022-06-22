#include "colors.inc"
#declare swingset=
  
union
  {
    cylinder {  <0,sqrt(3)/2,-1>  <-0.5,0,-1>  0.01 texture { pigment { color DarkGreen } finish { reflection 0.1 phong 0.2 } }}
    cylinder {  <0,sqrt(3)/2,-1>   <0.5,0,-1>  0.01 texture { pigment { color DarkGreen } finish { reflection 0.1 phong 0.2 } }}
    cylinder {  <0,sqrt(3)/2,-1>  <0,sqrt(3)/2,1>  0.01 texture { pigment { color DarkGreen } finish { reflection 0.1 phong 0.2 } }}
    cylinder {  <0,sqrt(3)/2, 1>  <-0.5,0,1>  0.01 texture { pigment { color DarkGreen } finish { reflection 0.1 phong 0.2 } }}
    cylinder {  <0,sqrt(3)/2, 1>  <0.5,0,1>  0.01 texture { pigment { color DarkGreen } finish { reflection 0.1 phong 0.2 } }}
    cylinder {  <-0.25,sqrt(3)/4, -1>  <0.25,sqrt(3)/4,-1>  0.01 texture { pigment { color White } finish { reflection 0.1 phong 0.2 } }}
    cylinder {  <-0.25,sqrt(3)/4, 1>  <0.25,sqrt(3)/4,1>  0.01 texture { pigment { color White } finish { reflection 0.1 phong 0.2 } }}
    
    // chains
    cylinder {  <0,sqrt(3)/2, -2/3>  <0,0.25,-2/3>  0.003 texture { pigment { color Gray } finish { reflection 0 phong 0.2 } }}
    cylinder {  <0,sqrt(3)/2, -1/3>  <0,0.25,-1/3>  0.003 texture { pigment { color Gray } finish { reflection 0 phong 0.2 } }}

    cylinder {  <0,sqrt(3)/2, 2/3>  <0,0.2,2/3>  0.003 texture { pigment { color Gray } finish { reflection 0 phong 0.2 } }}
    cylinder {  <0,sqrt(3)/2, 1/3>  <0,0.2,1/3>  0.003 texture { pigment { color Gray } finish { reflection 0 phong 0.2 } }}

    // seats
    difference
    {
      difference
      {
	cylinder { <-0.02, sqrt(3)/2 - 0.021, -1/2> <0.02, sqrt(3)/2 - 0.021, -1/2 > (2*sqrt(3)-1)/4 texture { pigment { color Tan } finish { reflection 0 phong 0.2 } }}
	cylinder { <-0.03, sqrt(3)/2 - 0.021, -1/2> <0.03, sqrt(3)/2 - 0.021, -1/2 > ((2*sqrt(3)-1)/4 - 0.01 )}
      }
      box { <-1, 0.26, -2> <1, 5, 2> }
    }

  
    difference
    {
      difference
      {
	cylinder { <-0.02, sqrt(3)/2 - 0.07, 1/2> <0.02, sqrt(3)/2 - 0.07, 1/2 > (2*sqrt(3)-1)/4 texture { pigment { color Tan } finish { reflection 0 phong 0.2 } }}
	cylinder { <-0.03, sqrt(3)/2 - 0.07, 1/2> <0.03, sqrt(3)/2 - 0.07, 1/2 > ((2*sqrt(3)-1)/4 - 0.01 )}
      }
      box { <-1, 0.21, -2> <1, 5, 2> }
    }

  };
//#end