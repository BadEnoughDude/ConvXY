//fn=150;
module convex (length,lensRad1,lensRad2,dist){ //Generates a convex lens, takes arguments length (radius of lens lengthwise), lensrad1 (radius of lens side 1 from center),lensrad2 (radius of lens side 2 from center), dist (added distance between rim of each side of lens)
	hull(){
		union(){
			intersection(){
				resize(newsize=[2*length,2*length,lensRad1])sphere(r=100);
				cylinder(lensRad1,length+1,length+1);
			}
			cylinder(dist,length,length);
			difference(){
				translate([0,0,dist])resize(newsize=[2*length,2*length,lensRad2])sphere(r=100);
				cylinder(lensRad2,length+1,length+1);}
		}
	}
}
module concave(length,lensRad1,lensRad2,dist){//Generates a concave lens, takes the same arguments as concave lens, but computes subtractively

	difference(){
	difference(){
	cylinder((lensRad1+lensRad2)/2+dist,length,length);
	resize(newsize=[2*length,2*length,lensRad1])sphere(r=100);}
	translate([0,0,dist+((lensRad1+lensRad2)/2)])resize(newsize=[2*length,2*length,lensRad2])sphere(r=100);}
	
}
module vexcave(length,lensRad1,lensRad2,dist){//Generates a concave lens, takes the same arguments as concave lens, but computes subtractively
	union(){
	difference(){
	cylinder((lensRad1+lensRad2)/2+dist,length,length);
	resize(newsize=[2*length,2*length,lensRad1])sphere(r=100);}
	
	translate([0,0,dist+((lensRad1+lensRad2)/2)])resize(newsize=[2*length,2*length,lensRad2])sphere(r=100);}
	
}


convex(50,10,30,0);
