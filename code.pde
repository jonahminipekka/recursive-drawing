/**
 * Custom Recursive Tree
 * rewritten from Daniel Shiffman
 * Mouse X controls branch angle
 */

float angle;

void setup() {
  size(640, 360);
  stroke(255);
}

void draw() {
  background(0);

  // angle based on mouse position
  angle = map(mouseX, 0, width, 0, PI/2);

  // start at bottom center
  translate(width/2, height);

  // draw trunk
  line(0, 0, 0, -120);
  translate(0, -120);

  // start recursion
  branch(120);
}

void branch(float len) {
  len *= 0.66;

  if (len > 4) {
    pushMatrix();
    rotate(angle);
    line(0, 0, 0, -len);
    translate(0, -len);
    branch(len);
    popMatrix();

    pushMatrix();
    rotate(-angle);
    line(0, 0, 0, -len);
    translate(0, -len);
    branch(len);
    popMatrix();
  }
}
