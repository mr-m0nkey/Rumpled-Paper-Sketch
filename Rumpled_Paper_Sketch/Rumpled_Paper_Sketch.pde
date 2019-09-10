/**
 * Texture Triangle. 
 * 
 * Using a rectangular image to map a texture onto a triangle.
 */

PImage img;

void setup() {
  
  img = loadImage("ReceiptImage.Jpeg");
  size(1000, 1000, P3D);
  noStroke();
  

   

}

float interval;

void draw() {
  background(0);
  translate(300, 300);
    interval = random(1, 100);
    if(interval < 50) {
      interval = random(3, 10);
    } else {
      interval = random(40, 60);
    }

       float seed = random(-3, 3)/10;
rotateX(6.7);
lights();

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

      if(interval <= 25) {
        
        terrain1 = map(noise((x/interval) /xrand, (y/interval) /yrand), 0, 1, -zBound, zBound);
        terrain2 = map(noise((x/interval) /xrand, ((y + interval)/interval) /yrand), 0, 1, -zBound, zBound);
      } else {
             terrain1 = map(noise(x/1000, y/seed) , 0, 1, -40, 40);

       terrain2 = map(noise(x/1000, (y + interval)/seed), 0, 1, -40, 40);

      } 

      vertex(x , y, terrain1, x, y);
      vertex(x , y + interval , terrain2, x, y + interval);
      
      if(x + interval >= img.width) {
        float leftover = img.width - x;
        vertex(x + leftover , y, terrain1, x + leftover, y);
      vertex(x + leftover , y + interval , terrain2, x + leftover, y + interval);
      }
      
    
      
    }
    
    
          endShape();

  }
  
 saveFrame("linee-######.jpg");
}