void drawUserView() {

  background(0);
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

  fill(255);
  box(10, 5, 10);

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
