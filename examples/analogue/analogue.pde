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
        // reset the sketch
        background(0, 0, 0);

        // calculate angles
        float second_angle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
        float minute_angle = map(minute()+5 + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
        float hour_angle = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

        // draw clock face
        noStroke();
        fill(80);
        ellipse(clockCentreX, clockCentreY, clockDiameter, clockDiameter);

        stroke(255, 255, 255);
        // draw second hand
        strokeWeight(1);
        line(clockCentreX, clockCentreY, clockCentreX + cos(second_angle) * secondsRadius, clockCentreY + sin(second_angle) * secondsRadius);
        // draw minute hand
        strokeWeight(2);
        line(clockCentreX, clockCentreY, clockCentreX + cos(minute_angle) * minutesRadius, clockCentreY + sin(minute_angle) * minutesRadius);
        //draw  hour hand
        strokeWeight(4);
        line(clockCentreX, clockCentreY, clockCentreX + cos(hour_angle) * hoursRadius, clockCentreY + sin(hour_angle) * hoursRadius);

        // draw markings
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
