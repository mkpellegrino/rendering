// Michael K. Pellegrino
// 2022 06 12

// create_forest( bot_left x, bot_left z, width, depth, DENSITY (0=DENSE  1=EMPTY... 0.95 is sparse))
#macro create_forest( a, b, w, h, d )
    #declare I=0;
#while( I<=w )
  #declare J=0;
  #while( J<=h )
    
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
