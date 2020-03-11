//FRACTAL PRACTICE, ALVARO GONZALEZ DE LA VEGA, 100363686

// ==== Standard POV-Ray Includes ====
#include "colors.inc"  // Standard Color definitions
#include "textures.inc"  // Standard Texture definitions
#include "functions.inc"  // internal functions usable in user defined functions

// ==== Additional Includes ====
// Don't have all of the following included at once, it'll cost memory and time
// to parse!
// --- general include files ---
#include "arrays.inc"     // macros for manipulating arrays
#include "chars.inc"      // A complete library of character objects, by Ken Maeno
#include "consts.inc"     // Various constants and alias definitions
#include "debug.inc"      // contains various macros for debugging scene files
#include "logo.inc"       // The official POV-Ray Logo in various forms
#include "math.inc"       // general math functions and macros
#include "rad_def.inc"    // Some common radiosity settings
#include "rand.inc"       // macros for generating random numbers
#include "shapes.inc"     // macros for generating various shapes
#include "shapes2.inc"    // some not built in basic shapes
#include "shapesq.inc"    // Pre-defined quartic shapes
#include "skies.inc"      // Ready defined sky spheres
#include "stars.inc"      // Some star fields
#include "strings.inc"    // macros for generating and manipulating text strings
#include "sunpos.inc"     // macro for sun position on a given date, time, and location on earth
#include "transforms.inc" // transformation macros 

// --- textures ---
#include "glass.inc"      // Glass textures/interiors
#include "golds.inc"      // Gold textures
#include "metals.inc"     // Metallic pigments, finishes, and textures

//CAMERA AND LIGHT

// general light definition
light_source {
  <0.5, 0, -1>      // position of the light source
  color rgb 1.0     // color of the light
  // spotlight
  // cylinder
  // parallel
  // area_light <AXIS1>, <AXIS2>, SIZE1, SIZE2
  // (---for spotlight/cylinder---)
  // radius FLOAT
  // falloff FLOAT
  // tightness FLOAT
  // point_at <VECTOR>   // for spotlight/cylinder/parallel
  // (---for area_light---)
  // adaptive FLOAT
  // jitter FLOAT
  // circular
  // orient
  // (---other modifiers---)
  // looks_like { OBJECT }
  // fade_distance FLOAT
  // fade_power FLOAT
  // media_attenuation BOOL
  // media_interaction BOOL
  // shadowless
}

// perspective (default) camera
camera {
  location  <0.0, 2.0, -5.0>
  look_at   <0.0, 0.0,  0.0>
  right     x*image_width/image_height
}

// starry sky ----------------
#include "stars.inc"
sphere{ <0,0,0>, 2
        texture{ Starfield1 scale 0.5
               } // end of texture
        scale 5
      } //end of sphere ---------------
      
        
      
      

sphere { <0,0,0>, 2 

//------------------------------------------------------------- 
 texture{ pigment{ color rgb< 1, 0.80, 0.55>*0.8}
          normal { pigment_pattern{ crackle turbulence 0.2
                                    colour_map {[0.00, rgb 0]
                                                [0.25, rgb 1]
                                                [0.95, rgb 1]
                                                [1.00, rgb 0]}
                                    scale 0.15} 1}

           finish  { phong 1 reflection 0.05 }
         }// end of texture ----------------
//------------------------------------------------------------ 


          scale<1,1,1>  rotate<0,0,0>  translate<3.5,3, 2>  
       }  // end of sphere ----------------------------------- 

      
      
      


#declare grey=texture { pigment{ color rgb< 1, 1, 1>*0.5 } //  color Gray50
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 }
                 } // end of texture
                 


//JULIA FRACTAL

    julia_fractal{ <-0.083,0.0,-0.83,-0.025>
   hypercomplex  // quaternion hypercomplex
   exp           // types: sqr cube
   max_iteration 5 
   precision 200       // 10...500

  
   texture{ grey
     pigment{ color rgb<1, 1, 1>}                                                                                                                                   
    //  normal { radial poly_wave frequency 12 scale 1.17  turbulence 0 rotate<90,0,0> }
     finish { phong 1  reflection{0.3 metallic 1}}
   } // end of texture  
   scale 0.2
   rotate<-75,120,-50>
   translate<1,0,-1>
} // end of julia_fractal ----------



 
 


//SIERPINSKI TRIANGLE GOT IT FROM THE LINK ON THE PRACTICE

#macro sierpinski (s, base_center, recursion_depth)
    #if (recursion_depth > 0)
        union {
            sierpinski(s / 2, base_center + s/2*y,      recursion_depth - 1) // Top
            sierpinski(s / 2, base_center - s/2*(x+z),  recursion_depth - 1) // Base +x +z corner
            sierpinski(s / 2, base_center - s/2*(x-z),  recursion_depth - 1) // Base +x -z corner
            sierpinski(s / 2, base_center - s/2*(-x+z), recursion_depth - 1) // Base -x +z corner
            sierpinski(s / 2, base_center - s/2*(-x-z), recursion_depth - 1) // Base -x -z corner
        }
    #else
        difference{
            box { <1,1,1>, <-1,0,-1> }
            plane{ x-y,  -sqrt(2)/2}
            plane{ -x-y, -sqrt(2)/2}
            plane{ z-y,  -sqrt(2)/2}
            plane{ -z-y, -sqrt(2)/2}
            scale s*1.5
            translate base_center
        }
    #end
#end 

// general light definition
light_source {
  <0.1, 1, 1>      // position of the light source
  color rgb 1.0     // color of the light
  // spotlight
  // cylinder
  // parallel
  // area_light <AXIS1>, <AXIS2>, SIZE1, SIZE2
  // (---for spotlight/cylinder---)
  // radius FLOAT
  // falloff FLOAT
  // tightness FLOAT
  // point_at <VECTOR>   // for spotlight/cylinder/parallel
  // (---for area_light---)
  // adaptive FLOAT
  // jitter FLOAT
  // circular
  // orient
  // (---other modifiers---)
  // looks_like { OBJECT }
  // fade_distance FLOAT
  // fade_power FLOAT
  // media_attenuation BOOL
  // media_interaction BOOL
  // shadowless
} 

sphere { <0,0,0>, 1 

        texture { pigment{ color rgbt<0.1, 0.1, 1.00, 0.7>}
                  finish { phong 1.0 reflection 0.00}
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0.9,0.125,-1.2>  
       }  // end of sphere ----------------------------------- 



union{
object {
    sierpinski(3, <0, 0.5, 0>, 7)
    scale <0.3, 0.4, 0.3>
    translate <-1, 0, 2>
    texture{grey}
    }


//SHOT FIRED



    
cylinder { <-1,0,0>,<1,0,0>, 0.15
                    texture { pigment{ color rgb< 1, 0.25, 0> } //  red orange
                // normal { bumps 0.5 scale 0.05 }
                   finish { phong 1 reflection 0}
                 } // end of texture 
           scale 0.2 rotate<-90,60,0> translate<0.1,0.1,1>
         } // end of cylinder  ------------------------------------ 
         
         translate<-0.5, 0, 0.5>
}         
         
//FIRE EXPLOSION

#declare fire=pigment{ gradient y color_map{
  
               [0.6 color rgb< 1.0, 0.65, 0.0>]
               [0.8 color rgb< 1, 0.25, 0>]
               [0.95 color rgb< 1.0, 0, 0.0>]
               [1 color rgb<0.1, 0, 1.0>]
                 
  }
 } 
 
  
julia_fractal{ <-0.083,0.0,-0.83,-0.025>
   quaternion // quaternion hypercomplex
   cube             // Types: sqr  cube
   max_iteration 7
   precision 20     // 10...500

   texture{
     fire
     finish { phong 1}
   } // end of texture
   scale 0.5
   rotate<90,0,90>
   translate<0.8,0.2,1>
} // end of julia_fractal -------- 


/*julia_fractal{ <-0.083,0.0,-0.83,-0.025>
   quaternion // quaternion hypercomplex
   cube             // Types: sqr  cube
   max_iteration 7
   precision 20     // 10...500

   texture{
     pigment{color rgb<0.5,0.5,0.5>}
     finish { phong 1}
   } // end of texture
   scale 0.5
   rotate<90,90,90>
   translate<-2.0,0.2,1>
} // end of julia_fractal --------*/ 
