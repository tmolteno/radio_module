

/* [Facets] */

$fn = 60;        // [3:60] 



/* [Extrusion] */

$EC = 0.4;       // [0:.01:1]



/* [Body] */

// Internal Height
IH      = 5;    // [5:.01:30]

// Split Point
Split_P = .5;    // [.2:.01:.7]

// Internal Pipe Diameter (face to face)
Int_PD  = 20;    // [4:.01:50] 

//Internal Taper Offset
TOff    = 1.5;     // [ .5:.01:4]

//cosine factor
CF= 1/cos(180/$fn);

/* [Cap] */

Cap_D = Int_PD+1;      // [2:.01:75]
Cap_H = 2;       // [2:.01:75]
Cap_Taper = .1;   // [0:.01:1]



/* [Slices] */
// Number of slices
Num_Slice = 6;        // [3:15]

// Wall Thickness
Wal_Thk = 1.5;     // [1:.01:10] 

// Gap between slices
Gap = 1 ;        // [.5:.01:2]

// Distance from Cap to Slice
Z_Off  = .1;     // [0:.01:1]

// Slice Phase
Phase = 0;       // [0:60]





difference() {
   Body();
   slots();
    
   // Hollow
   translate([0,0,-.01])
   cylinder(d=(Int_PD-2*Wal_Thk)*CF-$EC, h=IH);
}


module Body() {
   // Bottom Taper
   cylinder(d1=(Int_PD-TOff)*CF-$EC, d2=Int_PD*CF-$EC, h=IH*Split_P);

   // Top Taper
   translate([0,0,IH*Split_P-.01])
   cylinder(d1=Int_PD*CF-$EC, d2=(Int_PD-TOff)*CF-$EC, h=IH*(1-Split_P)+.02); 
   
   // Cap
   translate([0, 0, IH-.01])
   cylinder(d1=Cap_D*CF, d2=Cap_D*(1-Cap_Taper)*CF,h= Cap_H);
}


module slots() {
   h= IH *(1 - Z_Off);
   
   rotate([0,0,Phase])
   for(i = [0:Num_Slice]) {
      rotate([0,0,i*360/Num_Slice])
      translate([Int_PD/2,0,h/2-.01])
      cube([Int_PD+1,Gap,h],center=true);
   }
}



