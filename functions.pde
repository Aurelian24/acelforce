
/*Esta función esta porque el background que da processing 
no hace el efecto loco de la estela que se va borrando que a mi me gusta*/

/* Mira wacho, textual de la pagina de processing sobre el background : 

it is not possible to use the transparency 
alpha parameter with background colors on the main drawing surface.
It can only be used along with a PGraphics object and createGraphics().*/
void jp_background(float _v1, float _v2, float _v3, float _alpha){
  rectMode(CORNERS);
  //background(100,255,150,30);
  fill(_v1,_v2,_v3,_alpha);
  rect(0,0,width,height);
  rectMode(CENTER);
}

void wasd(Being _b,float _strong){
  
  
  if (keyPressed && key == 'w'){
     PVector WASD = new PVector (0,-_strong);
     _b.applyForce(WASD);
    
  }
   if (keyPressed && key == 's'){
     PVector WASD = new PVector (0,_strong);
     _b.applyForce(WASD);
    
  }
   if (keyPressed && key == 'a'){
     PVector WASD = new PVector (-_strong,0);
     _b.applyForce(WASD);
    
  }
   if (keyPressed && key == 'd'){
     PVector WASD = new PVector (_strong,0);
     _b.applyForce(WASD);
    
  }
  
}


void accelforce(Being _b,float _strong){
  
  
  PVector accelforce = new PVector (map(accelerometerX,-10,10,_strong,-_strong),map(accelerometerY,-10,10,-_strong,_strong));
  _b.applyForce(accelforce);
}