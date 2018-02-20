int clockCentreX, clockCentreY;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
    size(400, 400);
    clockCentreX = width / 2;
    clockCentreY = height / 2;
    int maxRadius = min(width, height) / 2;
    secondsRadius = maxRadius * 0.72;
    minutesRadius = maxRadius * 0.60;
    hoursRadius = maxRadius * 0.50;
    clockDiameter = maxRadius * 1.8;
}

void draw() {
    int all_black = 0;
    int all_grey = 80;
    int all_white = 255;
    background(all_black, all_black, all_black);
    fill(all_grey, all_grey, all_grey);
    noStroke();
    ellipse(clockCentreX, clockCentreY, clockDiameter, clockDiameter); 

    float second_angle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float minute_angle = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
    float hour_angle = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

    stroke(all_white, all_white, all_white);
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
