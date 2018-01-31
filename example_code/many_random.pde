import java.util.Random;

//By Dan Jones, George Sains, Theo, Kyle Patel

class Clock{
  int clockCentreX, clockCentreY;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int w, h;

  public Clock(int x, int y, int w, int h) {
this.w = w;
this.h = h;
clockCentreX = x + w / 2;
clockCentreY = y + h / 2;
int maxRadius = min(w, h) / 2;
secondsRadius = maxRadius * 0.72;
minutesRadius = maxRadius * 0.60;
hoursRadius = maxRadius * 0.50;
clockDiameter = maxRadius * 1.8;
}

Random ran = new Random();

  void draw() {
     clockCentreX +=  ran.nextGaussian() * 10;
     clockCentreY += ran.nextGaussian() * 10;
     w += ran.nextGaussian() * 10;
     h += ran.nextGaussian() * 10;
     int maxRadius = min(w, h) / 2;
secondsRadius = maxRadius * 0.72;
minutesRadius = maxRadius * 0.60;
hoursRadius = maxRadius * 0.50;
clockDiameter = maxRadius * 1.8;
     
     if (clockCentreX == 0)
       clockCentreX = 1080;
      if (clockCentreY == 0)
        clockCentreY = 720;
  fill(ran.nextInt(255), ran.nextInt(255), ran.nextInt(255));
  noStroke();
  ellipse(clockCentreX, clockCentreY, clockDiameter, clockDiameter);

  float second_angle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float minute_angle = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float hour_angle = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  stroke(255, 255, 255);
  // control the thickness of the hand
  strokeWeight(1);
  line(clockCentreX, clockCentreY, clockCentreX + cos(second_angle) * secondsRadius, clockCentreY + sin(second_angle) * secondsRadius);
  // minute hand
  strokeWeight(2);
  line(clockCentreX, clockCentreY, clockCentreX + cos(minute_angle) * minutesRadius, clockCentreY + sin(minute_angle) * minutesRadius);
  // hour hand
  strokeWeight(4);
  line(clockCentreX, clockCentreY, clockCentreX + cos(hour_angle) * hoursRadius, clockCentreY + sin(hour_angle) * hoursRadius);


  strokeWeight(2);
  beginShape(POINTS);
  for (int degrees = 0; degrees < 360; degrees+=6) {
  float rads = radians(degrees);
    float tick_mark_x = clockCentreX + cos(rads) * secondsRadius;
    float tick_mark_y = clockCentreY + sin(rads) * secondsRadius;
    vertex(tick_mark_x, tick_mark_y);
    }
    endShape();
  }
}

Clock[] clocks = new Clock[100];
void setup() {
  size (1080, 720);
  Random ran = new Random();
  for (int i = 0; i < clocks.length; i++)
    clocks[i] = new Clock(ran.nextInt(1080), ran.nextInt(720), 100, 100);
}
Clock clock = new Clock(0,0,100,100);
void draw(){
  background(255, 0, 255);
  for (Clock i : clocks)
    i.draw();
  // clock.draw();
}
