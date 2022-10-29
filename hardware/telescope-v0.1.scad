include <BOSL2/std.scad>
include <BOSL2/screws.scad>

phone_height = 145.6;
phone_width = 68.2;
phone_thickness = 7.9;
enclosure_thickness = 4;
enclosure_height = phone_height + 2 * enclosure_thickness;
enclosure_width = phone_width + 2 * enclosure_thickness;
hanger_height = 10;
hanger_thickness = 3;
hanger_nail_diameter=4;

module hanger() {
	linear_extrude(hanger_thickness)
		difference() {
			square([enclosure_width, hanger_height]);

			// TODO: Get the nail size
			translate([enclosure_width / 4, hanger_height / 2, 0])
				circle(d=hanger_nail_diameter);

			translate([enclosure_width * 3 / 4, hanger_height / 2, 0])
				circle(d=hanger_nail_diameter);
		}
}

module enclosure() {
	difference() {
		cube([
			enclosure_width,
			enclosure_height,
			phone_thickness
		]);

		translate([enclosure_thickness, enclosure_thickness, enclosure_thickness])
			cube([
				phone_width,
				phone_height,
				phone_thickness
			]);

	}
}

module enclosure_with_screw_holes() {
	difference() {
		enclosure();

		translate([enclosure_thickness / 2, enclosure_thickness / 2, 6])
			screw_hole("M2,6",anchor=BOTTOM,thread=true);

		translate([phone_width + enclosure_thickness, enclosure_thickness / 2, 6])
			screw_hole("M2,6",anchor=BOTTOM,thread=true);
	}
}

translate([0, -hanger_height, 0])
	hanger();
enclosure_with_screw_holes();
translate([0, phone_height + 2 * enclosure_thickness, 0])
	hanger();

