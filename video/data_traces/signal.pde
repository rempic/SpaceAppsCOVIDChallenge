public class signal
{
  
  private long size_x = 1;
  private long size_y = 1;
  private long pos_x = 0;
  public long pos_y = 0;
  private long dright = 1;
  private int col_R = 100;
  private int col_G =100;
  private int col_B = 100;
  private color obj_color = color(col_R, col_G, col_B);
  private boolean bshow=true;
  private long size_inc_x = 0;
  private long size_inc_y = 0;
  private long size_h_max = 0;
  private long size_w_max = 0;
  private String shape_type = "ellipse";
  private boolean size_lock = false;
  public float val_sign = 0;
   
  public signal(long size_h_max, long size_w_max){
     this.size_w_max = size_w_max;
     this.size_h_max = size_h_max;
  }
  
  public void set_size_lock(boolean lockit){
    size_lock = lockit;
  }
  //private int alpha = 100;
  public  long get_size_inc_x(){
    return this.size_inc_x;
  }
  
  public  long get_size_inc_y(){
    return this.size_inc_y;
  }
  
  public  void set_size_inc_y(long inc){
     this.size_inc_y = inc;
  }
  
  public  void set_size_inc_x(long inc){
     this.size_inc_x = inc;
  }
  
  
  public void set_sizew(long x){
    this.size_x = x;
  }
  
  public void set_sizeh(long y){
    this.size_y = y;
  }
  
  public void change_sizeh_inc(){
    
    long y = this.size_y + this.size_inc_y;
    if(y >0 && (y/2)+this.pos_y<this.size_h_max && !size_lock)
      this.size_y = y;
  }
  
  public void change_sizew_inc(){
    long x = this.size_x + this.size_inc_x;
    if(x>0)
      this.size_x = x;
  }
  
  public void set_shape(String type){
   
    
    shape_type = type;
  }
  
  public void set_posx(long pos_x){
    this.pos_x = pos_x;
  }
  
  public void set_posy(long pos_y){
    this.pos_y = pos_y;
  }
  
  public void set_dright(long dright){
    this.dright = dright;
  }
  
  public void set_color(int R,int G, int B){
    
    this.col_R =R;
    this.col_G =G;
    this.col_B =B;
    this.obj_color = color(R,G,B);
  }
  
  public void set_color_inc(int inc){
    
    if(this.col_R + inc>=0 && this.col_R + inc<=255)
      this.col_R = this.col_R + inc;
      
    if(this.col_G + inc>=0 && this.col_G+ inc<=255)
      this.col_G = this.col_G + inc;
      
    if(this.col_B + inc>=0 && this.col_B + inc<=255)
      this.col_B = this.col_B + inc;
    
    this.obj_color = color(this.col_R,this.col_G,this.col_B);
  }
  
  public void show(){
   
    if (this.bshow){
      //this.set_sizeh_inc(5);
      //this.set_sizew_inc(5);
      
      if(size_lock)
        fill(this.obj_color, 3);
      else
        fill(this.obj_color, 20);
      //stroke(0.1);
      //strokeWeight(0.1);
      //stroke(204, 102, 0);
      noStroke();
      //fill(this.obj_color,100);
      //rect(this.pos_x, this.pos_y, this.size_x, this.size_y);
      
      if(this.shape_type=="ellipse")
        ellipse(this.pos_x, this.pos_y,this.size_x, this.size_y);
        
      if(this.shape_type=="rect"){
        
        rect(this.pos_x, this.pos_y,this.size_x, this.size_y);
      }
      //filter(BLUR, 6);
      //this.alpha = this.alpha - 5;
    }
    
  }
  
  public boolean isactive(){
    return this.bshow;
  }
  
  
  public void move_right(int inc_move){
    
    
    this.pos_x = this.pos_x + inc_move; //this.dright;
    
    if(this.pos_x-this.size_x/2 >size_w_max){
      this.bshow=false;
    }
  }
}
