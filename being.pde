class Being{

    float size;
    float topspeed;
    float vibr;
    float stm ; //Speed towards mouse
    float mass;
    
    float W;
    float H;
    float hue;
    
    color colorfigura;
    PVector Speed;
    PVector pos;
    PVector accel;
    boolean edgemode=false;
     
    PShape polygon;
 
     Being(float _mass,float _vibr, float _x, float _y,color _c,float _W,float _H,float _topspeed){
          mass = _mass;
          topspeed = _topspeed;
          size = 35;
          hue = random(255);
          pos = new PVector(_x,_y);
          Speed =  new PVector(0,0);
          accel =  new PVector(0,0);    
          vibr = _vibr;
          stm = 15; //SPEED TOWARDS MOUSE
          
          colorfigura = _c;
          polygon = loadShape("poligono.svg");
          polygon.disableStyle();
           
           W = _W;
           H = _H;
         
    }
   
    void display(){  
      
      checkEdges();
      float angle = atan2(Speed.y,Speed.x);
      
      fill(255,0,255);
      stroke(colorfigura);
      pushMatrix();
      translate(pos.x,pos.y);
      rotate(angle);   
    
      shape(polygon, 0, 0,W,H);  // Draw at coordinate (110, 90) at size 100 x 100
      popMatrix();
    }
   
    void upgrade(){
      //Rando part of the move of the being
      PVector rdm = PVector.random2D();
      rdm.mult(vibr);
      Speed.add(rdm);
      
      if (mousePressed){
        PVector mouse = new PVector(mouseX,mouseY);
         PVector dir = PVector.sub(mouse,pos);
         dir.normalize();
         dir.mult(stm);
         Speed.add(dir);
      }else{
      //Speed.limit(topspeed);
      }
      
      Speed.add(accel);
      Speed.limit(topspeed);
      pos.add(Speed);
      accel.mult(0);
    }
    void applyForce(PVector _force){
       PVector f = PVector.div(_force,mass);
       accel.add(f); 
    }
    
    void checkEdges(){     
      if (edgemode){
        if (pos.x > width) {
          pos.x = 0;
        } 
        else if (pos.x < 0 ) {
         pos.x = width;
        }
        if (pos.y > height){
        pos.y = 0;
        }
        if (pos.y < 0){ 
          pos.y = height;
        }
      }
      else {
        if (pos.x > width) {
          pos.x = width;
          Speed.x *=-1;
        } 
        else if (pos.x < 0 ){
        pos.x = 0;
        Speed.x *= -1;
        }
        if (pos.y > height){
          pos.y = height;
          Speed.y *=-1;
        }
        else if (pos.y < 0){
        pos.y = 0;
        Speed.y *=-1;   
        }
      }
    }
}