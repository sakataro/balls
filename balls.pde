
int THENUMBEROFBALL = 10;

Ball[]  ball = new Ball[THENUMBEROFBALL];
double[] x_ini = new double[100];
double[] y_ini = new double[100];


void setup(){
 // background(255);
  size(800,800);
  for(int i=0 ; i < 10 ; i++){
    for(int j=0 ; j < 10 ; j++){
      x_ini[i*10+j] = width/11 * (j+1);
      y_ini[i*10+j] = height/11 * (i+1);
    }
  }
  for(int i = 0; i < THENUMBEROFBALL; i++ ){
  ball[i] = new Ball(x_ini[i],y_ini[i],0,0);
  }
}
  
 // ball[0] = new Ball(200,200,2,0);
 // ball[1] = new Ball(400,200,0,0);

void draw(){
  background(255);
  for(int i = 0; i < THENUMBEROFBALL ; i++){
    for(int j = 0; j < i; j++){
      ball[j].bounds(ball[i]);
    }
    ball[i].ballRun();
  }
  
}

void mouseClicked() {
  for (int i=0; i<THENUMBEROFBALL; i++){
    ball[i].v_x = -4+random(8);
    ball[i].v_y = -4+random(8);
  }

}

