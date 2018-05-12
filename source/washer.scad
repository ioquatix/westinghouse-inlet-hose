
$fn = 64;
od = 26.7;
radius = (26.7/2)-1;
thickness = 1.5;
outset = thickness+2;
flange = 6;
height = 10;

// top wall maximum 2mm thick in order to push through, 
// squishy bit needs to be about 3mm but retract to 2mm

module flange(height=6) {
	difference() {
		cylinder(r1=radius+outset, r2=radius+thickness, h=height);
		
		for (r = [0:360/12:180]) {
			rotate([0, 0, r]) translate([0, 0, 5]) cube([(radius+outset)*2, 2, 10], center=true);
		}
		
		cylinder(r1=radius+outset-1, r2=radius+thickness-1, h=height);
	}
}

render() difference() {
	union() {
		translate([0, 0, height-flange]) flange();
		
		cylinder(r=radius+1, h=10);
	}
	
	cylinder(r=radius, h=10);
	
	translate([radius, 0, 5]) cube([radius+3, 2, 10], center=true);
}
