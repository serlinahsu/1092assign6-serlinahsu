class Robot extends Enemy{
  // Requirement #5: Complete Dinosaur Class

  final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;
  
  float speed = 2f;
  int countLaser=0;
  boolean checkX;
  boolean checkY;
  Laser laser;

    // HINT: Player Detection in update()
    /*
  
    boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
            OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )
  
    boolean checkY = player is less than (or equal to) 2 rows higher or lower than me
  
    if(checkX AND checkY){
      Is laser's cooldown ready?
        True  > Fire laser from my hand!
        False > Don't do anything
    }else{
      Keep moving!
    }
  
    */
    
  void display(){
  pushMatrix();
  if (speed > 0) {
    translate(x, y);
    scale(1, 1);
    image(robot, 0, 0); 
  } else{
    translate(x+w, y);
    scale(-1, 1);
    image(robot, 0, 0); 
  }
    popMatrix();
    laser.display();
  }


  void update(){
    if((speed > 0 && player.x+w/2 > x+HAND_OFFSET_X_FORWARD)||
    (speed < 0 && player.x+w/2 < x+HAND_OFFSET_X_BACKWARD)){
      checkX = true;
    }
    else{
      checkX = false;
    }
    
    if(abs(player.y-y) <= PLAYER_DETECT_RANGE_ROW*h){
      checkY = true;
    }
    else{
      checkY = false;
    }
    
    if(countLaser > 0){
      countLaser -= 1;
    }
    
    if(checkX&&checkY){
      if(countLaser == 0){
        if(speed < 0){
          laser.fire(x+HAND_OFFSET_X_BACKWARD, y+HAND_OFFSET_Y, player.x+w/2,player.y+h/2);
          countLaser=LASER_COOLDOWN;
        }
        if(speed > 0){
          laser.fire(x+HAND_OFFSET_X_FORWARD,y+HAND_OFFSET_Y,player.x+w/2,player.y+h/2);
          countLaser=LASER_COOLDOWN;
        }
      }
    }else{
      if(x >= width-w||x<=0){
        speed*=-1;
      }
      x += speed;
    }
    
    laser.update();
    
  }
        
  
  void checkCollision(Player player){
    super.checkCollision(player);
    laser.checkCollision(player);
  }

  Robot(float x, float y){
    super(x, y);
    laser = new Laser();
  }
}
