class Ball {
  double x;
  double y;
  double v_x;
  double v_y;
  double r=50;
  double dr = 0;
  double a_y = 0;
  int    col_r;
  int    col_g;
  int    col_b;
  
  public Ball(double x,double y,double v_x,double v_y){
    this.x = x;
    this.y = y;
    this.v_x = v_x;
    this.v_y = v_y;
    //this.r   = random(100);
    col_r = (int)random(255);
    col_g = (int)random(255);
    col_b = (int)random(255);
  }
  
  void ballRun(){
    if (x <= r/2){
      this.x = r/2;
      v_x = -v_x;
    }
    if (x >= width-r/2){
      this.x = width-r/2;
      v_x = -v_x;
    }
    if (y <= r/2){
      this.y = r/2;
      v_y = -v_y;
    }
    if (y >= height-r/2){
      this.y = height-r/2;
      v_y = -v_y;
    }
    this.x += v_x;
    this.y += v_y;
    this.v_y += a_y;
    this.r += dr;
    if(this.r < 10.0){
      this.r = 10.0;
    }
    if(this.r > 150){
      this.r = 150;
    }
    fill(col_r,col_g,col_b);
    noStroke();
    ellipse((float)x,(float)y,(float)r,(float)r);
  }
  
  void bounds(Ball ball){
    double dist_x = this.x-ball.x;
    double dist_y = this.y-ball.y;
    double dist   = Math.sqrt(dist_x*dist_x+dist_y*dist_y);
    if(dist <= (this.r/2+ball.r/2)){
      double axel_x = (dist_x*(ball.v_x-this.v_x)+dist_y*(ball.v_y-this.v_y))*dist_x/(dist*dist);
      double axel_y = (dist_x*(ball.v_x-this.v_x)+dist_y*(ball.v_y-this.v_y))*dist_y/(dist*dist);
      this.v_x += axel_x;
      this.v_y += axel_y;
      ball.v_x -= axel_x;
      ball.v_y -= axel_y;
      double revi_x = (this.r/2+ball.r/2-dist) * dist_x/dist;
      double revi_y = (this.r/2+ball.r/2-dist) * dist_y/dist;
      this.x   += revi_x;
      this.y   += revi_y;
      ball.x   -= revi_x;
      ball.y   -= revi_y;
//      int  dum_r  = this.col_r;
//      int  dum_g  = this.col_g;
//      int  dum_b  = this.col_b;
//      this.col_r  = ball.col_r;
//      this.col_g  = ball.col_g;
//      this.col_b  = ball.col_b;
//      ball.col_r  = dum_r;
//      ball.col_g  = dum_g;
//      ball.col_b  = dum_b;
      this.dr          = -this.dr;
      ball.dr          = -ball.dr;
    }
  }
}

