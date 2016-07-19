class ShellFragment{

  PVector location;
  PVector velocity;
  //PVector acceleration;
  float lifespan;
  
  float size;
  
  ShellFragment(float x, float y, float size_){
    size = size_;
    velocity = PVector.random2D();
    velocity.mult(3);
    location = new PVector(x,y);
    lifespan = 100;
  }
  
  void run(){
    update();
    display();
  }
  
  void update() {
    location.add(velocity);
    lifespan -= 2;
    //println(lifespan);
    if (lifespan == 0) {
      //println(location.x);
    }
     
  }
  
   void display(){
    displayTriangle(location, size);
 }
 
 ArrayList<ShellFragment> subShellFragments(){
   float halfWidth = size * 2/3; 
   
   ArrayList<ShellFragment> subShellFragments = new ArrayList<ShellFragment>();
   subShellFragments.add(new ShellFragment(location.x, location.y, size/2));
   subShellFragments.add(new ShellFragment(location.x + halfWidth/2, location.y + size/2, size/2));
   subShellFragments.add(new ShellFragment(location.x - halfWidth/2, location.y + size/2, size/2));
   subShellFragments.add(new ShellFragment(location.x, location.y + size, -size/2));
   
   return subShellFragments;
   
   
 }
   
 boolean isDead() {
   if(lifespan < 0){
     return true;
   }
   else {
     return false;
   }
 }
}
    
  
