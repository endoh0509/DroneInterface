void drawUserView() {

  background(20);
  drawGround(60);
  
  camera(
    userPos.x, userPos.y, userPos.z, 
    pos.x, pos.y, pos.z, 
    0, 1, 0
    );

  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  
  PMatrix3D yMat = new PMatrix3D();
  yMat.rotateY(angX);
  PMatrix3D xMat = new PMatrix3D();
  yMat.rotateX(angY);
  
  xMat.apply(yMat);
  applyMatrix(xMat);

  //drone
  fill(255);
  stroke(0);
  box(10, 5, 10);
  
  //shadow
  pushMatrix();
  translate(0, -pos.y-1, 0);
  rotateX(PI/2);
  noStroke();
  float shadowSize = map(pos.y, 0, -WORLD_SIZE/2, 10, 0);
  fill(0);
  println(pos.y);
  rect(-shadowSize/2, -shadowSize/2, shadowSize, shadowSize);
  popMatrix();

  //***** drawAxis *****
  //X
  pushStyle();
  strokeWeight(3);
  stroke(255, 0, 0);
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(0, 0, 50);
  endShape();
  //Y
//  userView.stroke(0, 255, 0);
//  userView.beginShape(LINES);
//  userView.vertex(0, 0, 0);
//  userView.vertex(0, -50, 0);
//  userView.endShape();
//  //Z
//  userView.stroke(0, 0, 255);
//  userView.beginShape(LINES);
//  userView.vertex(0, 0, 0);
//  userView.vertex(50, 0, 0);
//  userView.endShape();
//  userView.popStyle();

  popMatrix();
  
}