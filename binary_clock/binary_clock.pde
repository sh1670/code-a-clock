int on_colour = 255;
int off_colour = 0;
  
void setup() {
  size(340, 200);
  smooth();
  noStroke();
}

void draw() {
  background(off_colour);
  String  bin_time_str = nf(int(binary(hour())),6)+nf(int(binary(minute())),6)+nf(int(binary(second())),6);
  
  int i=0;
  for(int row=0; row<3; row++){
    for(int col=0; col<6; col++){
      if (bin_time_str.charAt(i) == '1') {
        fill(on_colour);
      } else {
        fill(off_colour);
      }
      ellipse(20+50*col,25+50*row,50,50);
      i++;
    }
   }

}