void drawUserView() {

  userView.beginDraw();
  userView.background(0);

  userView.camera(
    userPos.x, userPos.y, userPos.z, 
    pos.x, pos.y, pos.z, 
    0, 1, 0
    );

  userView.pushMatrix();
  userView.translate(pos.x, pos.y, pos.z);
  
  PMatrix3D yMat = new PMatrix3D();
  yMat.rotateY(ang.x);
  PMatrix3D xMat = new PMatrix3D();
  yMat.rotateX(ang.y);
  
  xMat.apply(yMat);
  userView.applyMatrix(xMat);

  userView.fill(255);
  userView.box(10, 5, 10);

  //***** drawAxis *****
  //X
  userView.pushStyle();
  userView.strokeWeight(3);
  userView.stroke(255, 0, 0);
  userView.beginShape(LINES);
  userView.vertex(0, 0, 0);
  userView.vertex(0, 0, 50);
  userView.endShape();
  //Y
  userView.stroke(0, 255, 0);
  userView.beginShape(LINES);
  userView.vertex(0, 0, 0);
  userView.vertex(0, -50, 0);
  userView.endShape();
  //Z
  userView.stroke(0, 0, 255);
  userView.beginShape(LINES);
  userView.vertex(0, 0, 0);
  userView.vertex(50, 0, 0);
  userView.endShape();
  userView.popStyle();

  userView.popMatrix();
  
  userView.endDraw();

  drawGround(userView, 60);
}