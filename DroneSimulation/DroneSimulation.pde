int WORLD_SIZE = 600;
PVector userPos;
PVector pos, look;
PVector ang;
PGraphics userView, droneView;

void setup() {
  size(1200, 600, P2D);

  userPos = new PVector(0, -50, WORLD_SIZE/2);
  pos = new PVector(0, 0, 100);

  ang = new PVector(0.0, 0.0);
  float phi = ang.x;
  float theta = ang.y;
  float x = 10.0 * sin(phi) * cos(theta);
  float y = 10.0 * sin(phi) * sin(theta);
  float z = 10.0 * cos(phi);
  look = new PVector(x, y, z);
  look.add(pos);

  userView = createGraphics(WORLD_SIZE, WORLD_SIZE, P3D);
  droneView = createGraphics(WORLD_SIZE, WORLD_SIZE, P3D);
}

void draw() {
  image(userView, 0, 0);
  image(droneView, userView.width, 0);

  drawUserView();
  drawDroneView();

  ang.x = map(mouseX, 0, width, -PI, PI);

  PVector v;
  if (keyPressed) {
    switch(key) {
    case 'f':
      v = PVector.sub(look, pos).normalize().mult(1);
      pos.add(v);
      break;
    case 'u':
      pos.y--;
      break;
    case 'd':
      pos.y++;
      break;
    default:
      break;
    }
  }
  updateLook();
}

void updateLook() {
  float phi = ang.x;
  float theta = -ang.y;
  float x = 10.0 * sin(phi) * cos(theta);
  float y = 10.0 * sin(phi) * sin(theta);
  float z = 10.0 * cos(phi);
  look.set(x, y, z);
  look.add(pos);
}

void drawGround(PGraphics _pg, int _num) {
  _pg.beginDraw();
  _pg.pushMatrix();
  _pg.rotateX(PI/2);
  _pg.translate(-WORLD_SIZE/2, -WORLD_SIZE/2, 0);
  _pg.stroke(255);
  _pg.noFill();
  for (int y = 0; y < WORLD_SIZE; y += WORLD_SIZE / _num) {
    for (int x = 0; x < WORLD_SIZE; x += WORLD_SIZE / _num) {
      _pg.rect(x, y, WORLD_SIZE / _num, WORLD_SIZE / _num);
    }
  }
  _pg.popMatrix();
  _pg.endDraw();
}