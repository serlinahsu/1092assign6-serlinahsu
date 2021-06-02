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
    if(speed > 0){
      translate(x, y);
      scale(1,1);
      image(dinosaur, 0, 0);
    }else{
      translate(x+w, y);
      scale(-1, 1);
      image(dinosaur, 0, 0);
    }
    popMatrix();
  }
  
  void update(){
    //move opposite direction when dino reach side
    if(x >= width-w || x <= 0) speed = speed*-1;
    
    //speed up when dino see player
    if(y == player.y){
      if((speed > 0 && player.x > x) || (speed < 0 && player.y < y)){
        speed = speed*TRIGGERED_SPEED_MULTIPLIER;
      }
    }
    x += speed;
  }
  
  Dinosaur(float x,float y){
    super(x,y);
  } 
}
