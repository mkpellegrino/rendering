#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char name[15]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int my_strlen()
{
  for( int i=0; i<10; i++ )
    {
      if( name[i] == 0 ) return i;
    }
}
int main()
{
  int quality=9;
  int starting_frame=0;
  int ending_frame=0;
  int number_of_servers=0;
  int j=0;

  
  FILE *fp;

  printf( "Split Server - (C) 2022 - Michael K. Pellegrino\n");
  printf( "Starting_Frame: " );
  scanf( "%d", &starting_frame );
  printf( "Ending_Frame: " );
  scanf( "%d", &ending_frame );

  
  if( ending_frame <= starting_frame )
    {
      printf( "*** error ***\n*** invalid frame entry ***\n");
      exit(-1);
    }

  printf( "Quality (1-9): ");
  scanf( "%d", &quality );

  printf( "How many servers? ");
  scanf( "%d", &number_of_servers );

  printf( "Name (8 characters): ");
  scanf( "%s", &name );

  int l=0;
  l=my_strlen();
  if( l>8 )
    {
      printf( "*** error ***\n*** invalid name length ***\n");
      exit(-1);
    }

  int frames_per_server = ( ending_frame - starting_frame ) / number_of_servers;

  int k=starting_frame;
  
  for( int i=0; i<number_of_servers; i++ )
    {
      /* the name of file for server #(i+1) */
      name[l]=0x31+i;
      name[l+1]='.';
      name[l+2]='i';
      name[l+3]='n';
      name[l+4]='i';
      name[l+5]='\0';
      fp  = fopen (name, "w");
      int ff=k+frames_per_server;
      if( ff>ending_frame ) ff=ending_frame;
      fprintf( fp, "# ini-file for server %d\n", i+1 );
      fprintf( fp, "Initial_Frame=%d\n", k );
      fprintf( fp, "Final_Frame=%d\n", ff );
      fprintf( fp, "Initial_Clock=%d\n", k );
      fprintf( fp, "Final_Clock=%d\n", ff );

      
      fprintf( fp, "Height=480\n" );
      fprintf( fp, "Width=640\n" );
      fprintf( fp, "Verbose=true\n");
      fprintf( fp, "Output_to_File=true\n");
      name[l]='\0';
      fprintf( fp, "Output_File_Name=%s\n", name); // THIS NEED TO BE SET
      fprintf( fp, "Dither=true\n");
      fprintf( fp, "Dither_Method=FS\n");
      fprintf( fp, "Input_File_Name=%s.pov\n", name); // THIS NEED TO BE SET
      fprintf( fp, "Render_Block_Size=64\n");
      fprintf( fp, "Quality=\n", quality);
      fprintf( fp, "Antialias=true\n");
      fprintf( fp, "Bits_Per_Color=16\n");
      fprintf( fp, "Display=false\n");
      fprintf( fp, "Jitter=false\n");
      fprintf( fp, "Library_Path=/Users/mpellegrino/PovRay3.7.0.8_Unofficial_Final/include\n");
      fprintf( fp, "Library_Path=.\n");
      fprintf( fp, "Library_Path=..\n");
      /* fprintf( fp, "\n"); */
      
      k+=frames_per_server+1;
      fclose( fp );
    }


  return 0;
}
