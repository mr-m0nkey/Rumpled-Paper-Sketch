/**
 * Texture Triangle. 
 * 
 * Using a rectangular image to map a texture onto a triangle.
 */

PImage img;
PImage bg;
int bg_number;
String bg_name;
//PShader shadow;

void setup() {
  //size(800, 800, P3D);
  size(1512, 2016, P3D);
  //size(3024, 4032, P3D);
  img = loadImage("receipt2.PNG");
  //img = loadImage("ReceiptImage_with_shadow.Jpeg");
  //img.resize(img.width*6, img.height*6);
  //img.resize(img.width*10, img.height*10);
  //bg = loadImage("bg1_small.jpg");
  noStroke();
}

float interval;


void draw() {
  bg_number = int(random(13, 16));
  bg_name = "bg"+bg_number+"_small.jpg";
  //bg_name = "BG"+bg_number+".JPG";
  bg = loadImage(bg_name);
  background(bg);
  //translate(width/4, height/8, 0);
  translate(width/4, height/10, 0);
  //interval = random(3, 50);
  interval = random(1, 30);

  tint(-2);



  scale(3.0);
  //directionalLight(255, 255, 255, 10, 10,-10);
  //directionalLight(255, 255, 255, 500, 0,200);
  //directionalLight(255, 255, 255, -1, 0, 0);
  //lights();

  float seed = random(-10, 20)/10;
  //rotate(6.4);
  //rotateX(6.6);
  rotateX(6.3);
  float xrand, yrand;
  xrand = 10;
  yrand = 40;
  //if (random(1, 100) < 50) {
  //  xrand = 10;
  //  yrand = 40;
  //} else {
  //  xrand = 40;
  //  yrand = 10;
  //}

  float zBound = random(-20, 20);
  for (float y = 0; y < img.height; y += interval) {
    beginShape(TRIANGLE_STRIP);
    texture(img);

    for (float x = 0; x < img.width; x += interval) {

      float terrain1; 
      float terrain2;

      //terrain1 = map(noise((x/interval) /xrand, (y/interval) /yrand), 0, 1, -zBound, zBound);
      //terrain2 = map(noise((x/interval) /xrand, ((y + interval)/interval) /yrand), 0, 1, -zBound, zBound);

      if (interval <= 10) { //10
        terrain1 = map(noise((x/interval) /xrand, (y/interval) /yrand), 0, 1, -zBound, zBound);
        terrain2 = map(noise((x/interval) /xrand, ((y + interval)/interval) /yrand), 0, 1, -zBound, zBound);
      } else if (interval > 11 && interval <= 15) { //10 30
        terrain1 = map(noise((x/(img.width/seed)) * 1, (y/(img.height/seed)) * 1), 0, 1, -30, 30);
        terrain2 = map(noise((x/(img.width/seed)) * 1, ((y + interval)/(img.height/seed)) * 1), 0, 1, -30, 30);
      } else {
        terrain1 = map(noise(x/1000, y/100), 0, 1, -40, 40);
        terrain2 = map(noise(x/1000, (y + interval)/100), 0, 1, -40, 40);
      }
      
      vertex(x, y, terrain1, x, y);
      vertex(x, y + interval, terrain2, x, y + interval);
    }
    endShape();
  }  
  saveFrame("output/output-img-######.jpg");
}
