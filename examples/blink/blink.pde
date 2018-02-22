// by Workshop attendees, Team Name Illuminati

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
        secondsRadius = maxRadius * 0.45;
        minutesRadius = maxRadius * 0.45;
        hoursRadius = maxRadius * 0.3;
        clockDiameter = maxRadius * 1.8;
}

void draw() {
        // calculate clock angles
        float second_angle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
        float minute_angle = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
        float hour_angle = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
        background(0);
        noStroke();

        //white
        fill(255);
        ellipse(clockCentreX, clockCentreY, 400, 200);
        //iris
        fill(80);
        ellipse(clockCentreX, clockCentreY, 200, 200);
        //pupil
        fill(0);
        ellipse(clockCentreX, clockCentreY, 100, 100);


        stroke(255);
        // seconds hand
        strokeWeight(1);
        line(clockCentreX, clockCentreY, clockCentreX + cos(second_angle) * secondsRadius, clockCentreY + sin(second_angle) * secondsRadius);
        // minute hand
        strokeWeight(2);
        line(clockCentreX, clockCentreY, clockCentreX + cos(minute_angle) * minutesRadius, clockCentreY + sin(minute_angle) * minutesRadius);
        // hour hand
        strokeWeight(4);
        line(clockCentreX, clockCentreY, clockCentreX + cos(hour_angle) * hoursRadius, clockCentreY + sin(hour_angle) * hoursRadius);


        stroke(0);
        fill(0);
        //use milliseconds to time the blink
        int m  = millis()%1000;
        if (m<200) {
                rect(0,0,width, m*2);
        } else if (200 <= m && m <= 410) {
                rect(0,0,width, 400 - m);
        }

}
