m2_5_clearence = 3.0;
standoff_height = 12.1 - 1.6;
$fn=101;
difference() {
    cylinder(d=6, h=standoff_height);
    cylinder(d=m2_5_clearence, h=100, center=true);
}