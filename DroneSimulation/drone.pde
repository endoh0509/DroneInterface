void drawDroneView(){
  droneView.beginDraw();
  droneView.background(0);
  
  droneView.camera(
  pos.x, pos.y, pos.z,
  look.x, look.y, look.z,
  0, 1, 0
  );
  
  droneView.pushMatrix();
  droneView.translate(userPos.x, userPos.y, userPos.z);
  
  //**** drawText ****
  droneView.pushMatrix();
  droneView.textAlign(CENTER);
  droneView.textMode(SHAPE);
  droneView.translate(0,0,-10);
  droneView.rotateY(PI);
  droneView.fill(255, 0, 0);
  droneView.text("User", 0, 0);
  droneView.popMatrix();
  
  droneView.fill(255);
  droneView.box(10, 100, 10);
  droneView.popMatrix();
  
  droneView.endDraw();
  
  if(pos.y > -2.5){
    pos.y = -2.5;
  }
  
  drawGround(droneView, 60);
}