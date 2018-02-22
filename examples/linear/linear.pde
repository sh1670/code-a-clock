
void setup(){
        size(960, 600);
}

int seconds = 0;
int minutes = 0;
int hours = 0;
void draw(){
        background(20, 135, 196);
        // draw update rectangles per second, minute and hour
        fill((seconds*4)%255, 50, 50);
        rect(width/60*second(), 3*height/4, width/60, height/4);
        fill((minutes*4)%4, 87, 100);
        rect(width/60*minute(), height/3, width/60, 5*height/12);
        fill(56, 16, 178);
        rect(width/24*hour(), 0, width/24, height/3);
        // draw grid
        for(int i=0; i<width; i+=width/24) {
                line(i, 0, i, height/3);
                fill(196, 251, 252);
                text(i/40,i+6, height/6);
        }
        line(0, height/3, width, height/3);
        for(int i=0; i<width; i+= width/60) {
                line(i, height/3, i, 3*height/4);
                fill(196, 251, 252);
                text(i/16, i+2, 3*height/5);
        }
        line(0, 3*height/4, width, 3*height/4);
        for(int i=0; i<width; i += width/60) {
                line(i, 3*height/4, i, height);
                fill(216, 251, 255);
                text(i/16, i+2, 9*height/10);
        }
}
