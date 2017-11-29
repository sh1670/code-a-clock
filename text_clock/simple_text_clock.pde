void setup() {
  size(170, 40);
}

void draw() {
  background(0);
  
  String hour_string = Integer.toString(hour());
  String minute_string = Integer.toString(minute());
  String second_string = Integer.toString(second());
  
  String  time_string = hour_string + ":" + minute_string + ":" + second_string;
  
  textSize(32);
  text(time_string,10,30); 
}
