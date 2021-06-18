class Dinosaur extends Enemy{
  // Requirement #4: Complete Dinosaur Class

  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 1f;
  
  // HINT: Player Detection in update()
  /*
  float currentSpeed = speed
  If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
    currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
  }
  */

  void display(){
  pushMatrix();
  if (speed>0) {
    translate(x, y);
    scale(1, 1);
    image(dinosaur, 0, 0); 
  } else{
    translate(x+w, y);
    scale(-1, 1);
    image(dinosaur, 0, 0); 
  }
  popMatrix();
  }

  void update(){
    if(x >= width-w||x<=0){
        speed*=-1;}
        
    float currentSpeed = speed;
        
    if(player.y==y){
      if((currentSpeed>0&&player.x>x) || (currentSpeed<0&&player.x<x)){
        currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
      }
    }
    x += currentSpeed;
        
  }

  Dinosaur(float x, float y){
    super(x, y);
  }
}
