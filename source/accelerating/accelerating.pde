int clockCentreX, clockCentreY;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
float hour_inc = 0;
float minute_inc = 0;
float second_inc = 0;
float acceleration = 1;
float jerk = 0.001;  // rate of increasse of acceleration

void setup() {
        size(400, 400);
        clockCentreX = width / 2;
        clockCentreY = height / 2;
        int maxRadius = min(width, height) / 2;
        secondsRadius = maxRadius * 0.82;
        minutesRadius = maxRadius * 0.60;
        hoursRadius = maxRadius * 0.50;
        clockDiameter = maxRadius * 1.8;
}


void draw() {

        // first clear the canvas by drawing the background
        background(15, 100, 70);

        // now draw the clock face
        fill(0, 255, 0);
        noStroke();
        ellipse(clockCentreX, clockCentreY, clockDiameter, clockDiameter);

        // calculate the current hand angles
        float second_angle = map(second() + second_inc, 0, 60, 0, TWO_PI) - HALF_PI;
        float minute_angle = map(minute()  + minute_inc + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
        float hour_angle = map(hour() + hour_inc + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

        if(mousePressed) { // accelerate
                hour_inc = (hour_inc + jerk) * acceleration;
                minute_inc = (minute_inc + (jerk *60)) * acceleration;
                second_inc = (second_inc + (jerk * 60 * 60)) * acceleration;
                acceleration += jerk;
        }else{  // reset speed
                acceleration = 1;
                float hour_inc = 0;
                float minute_inc = 0;
                float second_inc = 0;
        }

        stroke(255, 255, 255);

        // second hand
        strokeWeight(1.5);
        line(clockCentreX, clockCentreY,clockCentreX + cos(second_angle) * secondsRadius, clockCentreY + sin(second_angle) * secondsRadius);
        // minute hand
        strokeWeight(7);
        line(clockCentreX, clockCentreY, 5+clockCentreX + cos(minute_angle) * minutesRadius, 5+clockCentreY + sin(minute_angle) * minutesRadius);
        // hour hand
        strokeWeight(10);
        line(clockCentreX, clockCentreY, 3+clockCentreX + cos(hour_angle) * hoursRadius, 3+clockCentreY + sin(hour_angle) * hoursRadius);

        // outer dots
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
