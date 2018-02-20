int centreX, centreY, clocksize;

void setup() {
  size(400, 400);
  centreX = width/2;
  centreY = height/2;
  clocksize = min(width, height)-20;
  background(0, 0, 0);
}

void draw() {
  float start_angle = -PI/2;
  float second_angle = start_angle + second()/30.0*PI;
  float minute_angle = start_angle + minute()/30.0*PI;
  float hour_angle   = start_angle + hour()  /12.0*PI;
  
  noStroke();
  background(0, 0, 0);

  fill(0,0,0);
  ellipse(centreX, centreY, clocksize, clocksize);
  fill(255,0,0);
  arc(centreX, centreY, clocksize, clocksize, start_angle, second_angle, PIE);
  
  fill(0,0,0);
  ellipse(centreX, centreY, clocksize/2, clocksize/2);
  fill(0,255,0);
  arc(centreX, centreY, clocksize/2, clocksize/2, start_angle, minute_angle, PIE);

  fill(0,0,0);
  ellipse(centreX, centreY, clocksize/3, clocksize/3);
  fill(0,0,255);
  arc(centreX, centreY, clocksize/3, clocksize/3, start_angle, hour_angle, PIE);

}
