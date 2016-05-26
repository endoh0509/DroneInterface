void drawDroneView(){
  background(0);
  
  drawGround(60);
  
  camera(
  pos.x, pos.y, pos.z,
  look.x, look.y, look.z,
  0, 1, 0
  );
  
  pushMatrix();
  translate(userPos.x, userPos.y, userPos.z);
  
  //**** drawText ****
  pushMatrix();
  textAlign(CENTER);
  textMode(SHAPE);
  translate(0,0,-10);
  rotateY(PI);
  fill(255, 0, 0);
  text("User", 0, 0);
  popMatrix();
  
  fill(255);
  box(10, 100, 10);
  popMatrix();
  
  if(pos.y > -2.5){
    pos.y = -2.5;
  }
}