class Rabbit {
  PVector location;
  PVector velocity;
  float hopForce = 0.03;

  //Constructor for Rabbit class
  Rabbit() {
    location = new PVector(100, height/2);
    velocity = new PVector(0.1, 0);
  }

  //"Rabbit" - will create a more realized character as I continue to develop this sketch in later assignments
  void display() {
    //stroke(0);
    //strokeWeight(1);
    //fill(255);
    noStroke();
    fill(#FFBEE6);
    
    rectMode(CENTER);
    rect(location.x, location.y, 40, 40);
    
    fill(random(0,250));
     strokeWeight(1);
    ellipse(location.x - 10, location.y - 4, 8, 8);
    strokeWeight(1);
    ellipse(location.x + 8, location.y + -4, 13, 13);
    
    //left rabbit ear
    noStroke();
    //fill(255);
    fill(#FFBEE6);
    
    pushMatrix();
    translate(location.x - 11, location.y - 25);
    beginShape();
    for (float a = 0; a < TWO_PI; a += 0.02) {
      float r = 5;
      float s = 15;
      float x = r * cos (a);
      float y = s * sin (a);
      //vertex are points on the shape
      vertex(x,y);
    }
    endShape(CLOSE);
    popMatrix();
    
    
    
    //right rabbit ear
    //stroke(0);
    noStroke();
    //fill(255);
    fill(#FFBEE6);
    
    pushMatrix();
    translate(location.x + 11, location.y - 25);
    beginShape();
    for (float a = 0; a < TWO_PI; a += 0.02) {
      float r = 5;
      float s = 15;
      float x = r * cos (a);
      float y = s * sin (a);
      //vertex are points on the shape
      vertex(x,y);
    }
    endShape(CLOSE);
    popMatrix();
    
    //white cotton ball tail
    noStroke();
    fill(255);
    ellipse(location.x + 22, location.y + 16, 10, 10);
  }

 //This is where the hop is initiated
  void startHop() {
    PVector mouse = new PVector(mouseX, -9); 
    PVector direction = PVector.sub(mouse, location); //is like z = x + y;
    direction.mult(hopForce);
    velocity = direction;
  }

//Check whether to initiate the hop or not
  void checkForHop() {
    if (mousePressed && isOnGround()) {
      startHop();
    }
  }

  void applyForce(PVector force) {
    velocity.add(force);
  }


  boolean isOnGround() {
    return (location.y == height-50) && (velocity.y == 0);
  }
  

  //Moving the position of the rabbit
  void update() {

    if (!isOnGround()) {
      location.add(velocity);
    }   

    if (location.y > height-50) {
      location.y = height-50;
      velocity.mult(0);
      
    }
    
  }
}


