void setup() {
        size(800, 600);
        background(66, 171, 205);
}

void draw() {
        noStroke();
        fill(205,66,171);
        if (mousePressed) {
                ellipse(mouseX, mouseY, 20, 20);
        }
}
