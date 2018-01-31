int on_colour = 255;
int off_colour = 0;
  
void setup() {
  size(360, 210);
  smooth();
  noStroke();
}

void draw() {
  background(off_colour);
  int hours = int(binary(hour()));
  int mins = int(binary(minute()));
  int secs = int(binary(second()));
  
  String  bin_time_str = nf(hours,6)+nf(mins,6)+nf(secs,6);
  
  int i=0;
  for(int row=0; row<3; row++){
    for(int col=0; col<6; col++){
      if (bin_time_str.charAt(i) == '1') {
        fill(on_colour);
      } else {
        fill(off_colour);
      }
      ellipse(55+50*col,55+50*row,50,50);
      i++;
    }
   }

}
