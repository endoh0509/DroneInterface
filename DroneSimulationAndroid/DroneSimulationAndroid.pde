int WORLD_SIZE = 600;
PVector userPos;
PVector pos, look;
float angX, angY;

float droneSpeed;
boolean isUserView = true;

void setup() {
  size(1200, 600, P3D);

  userPos = new PVector(0, -50, WORLD_SIZE/2);
  pos = new PVector(0, 0, 100);

  angX = 0;
  angY = 0;
  float phi = angX;
  float theta = angY;
  float x = 10.0 * sin(phi) * cos(theta);
  float y = 10.0 * sin(phi) * sin(theta);
  float z = 10.0 * cos(phi);
  look = new PVector(x, y, z);
  look.add(pos);
  droneSpeed = 1;
  
}

void draw() {
  if (isUserView == true) {
    drawUserView();
  } else {
//    drawDroneView();
  }


  //**** CHANGE ME START****
  angX = map(mouseX, 0, width, -PI, PI);
  PVector v;
  if (keyPressed) {
    switch(key) {
    case 'f':
      v = PVector.sub(look, pos);
      v.normalize();
      v.mult(droneSpeed);
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
  //**** CHANGE ME END****

  updateLook();
}

void updateLook() {
  float phi = angX;
  float theta = -angY;
  float x = 10.0 * sin(phi) * cos(theta);
  float y = 10.0 * sin(phi) * sin(theta);
  float z = 10.0 * cos(phi);
  look.set(x, y, z);
  look.add(pos);
}

void drawGround(int _num) {
  pushMatrix();
  rotateX(PI/2);
  translate(-WORLD_SIZE/2, -WORLD_SIZE/2, 0);
  strokeWeight(1);
  stroke(0, 200, 0);
  noFill();
  for (int y = 0; y < WORLD_SIZE; y += WORLD_SIZE / _num) {
    for (int x = 0; x < WORLD_SIZE; x += WORLD_SIZE / _num) {
      rect(x, y, WORLD_SIZE / _num, WORLD_SIZE / _num);
    }
  }
  //stroke(0);
  //fill(0, 200, 0);
  //rect(0, 0, WORLD_SIZE, WORLD_SIZE);
  popMatrix();
}

//public String sketchRenderer() {
//  return P3D;
//}