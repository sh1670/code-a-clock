void setup() {
        size(300, 300);
        background(66, 171, 205);
}

void draw() {
        noStroke();
        fill(205,66,171);
        if (mousePressed) {
                ellipse(mouseX, mouseY, 10, 10);
        }
}
