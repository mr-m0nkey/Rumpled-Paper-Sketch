/**
 * Texture Triangle. 
 * 
 * Using a rectangular image to map a texture onto a triangle.
 */

PImage img;

void setup() {
  size(1000, 1000, P3D);
  img = loadImage("ReceiptImage.Jpeg");
  noStroke();
  

   

}

float interval;


void draw() {
  background(0);
  translate(width/3, height/3, 0);
    interval = random(3, 10);
  
    

  scale(1.5);
    //  directionalLight(255, 255, 255, 10, 10,-10);
lights();

       float seed = random(-20, 20)/10;
rotateX(6.9);
float xrand, yrand;
      if(random(1, 100) < 50) {
         xrand = 10;
       yrand = 40;
      } else {
          xrand = 40;
       yrand = 10;
      }
      float zBound = random(5, 25);
  for(float y = 0; y < img.height; y += interval) {
          beginShape(TRIANGLE_STRIP);
      texture(img);
      

    for(float x = 0; x < img.width; x += interval) {
   
     

      float terrain1; 
      float terrain2;

      if(interval <= 10) {
        
        terrain1 = map(noise((x/interval) /xrand, (y/interval) /yrand), 0, 1, -zBound, zBound);
        terrain2 = map(noise((x/interval) /xrand, ((y + interval)/interval) /yrand), 0, 1, -zBound, zBound);
      } else if(interval > 10 && interval <= 30) {
             terrain1 = map(noise((x/(img.width/seed)) * 1, (y/(img.height/seed)) * 1), 0, 1, -30, 30);

       terrain2 = map(noise((x/(img.width/seed)) * 1, ((y + interval)/(img.height/seed)) * 1), 0, 1, -30, 30);
      } else {
            terrain1 = map(noise(x/1000, y/100), 0, 1, -40, 40);

       terrain2 = map(noise(x/1000, (y + interval)/100), 0, 1, -40, 40);

    }

      vertex(x , y, terrain1, x, y);
      vertex(x , y + interval , terrain2, x, y + interval);
      
    }
    
    
          endShape();

  }
  
 saveFrame("line-######.jpg");
}