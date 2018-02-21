void setup() {
        size(800, 600);
}

void draw() {
        noStroke();
        if (mousePressed) {
                fill(255,0,0);
        } else {
                fill(0,0,255);
        }
        ellipse(mouseX, mouseY, 20, 20);
}
