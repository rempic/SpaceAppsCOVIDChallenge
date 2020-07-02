
public class message{
    
  private String text = "";
  private long size = 0;
  private long pos_x = 0;
  public long pos_y = 0;
  public boolean shown = false;
    
  public message(String text, long pos_x, long pos_y, long size){
    this.set_text(text);
    this.set_size(size);
    this.set_pos_x(pos_x);
    this.set_pos_y(pos_y);
  }
  
  
  public void set_pos_x(long pos_x){
      this.pos_x = pos_x;
  }
    
  public void set_pos_y(long pos_y){
      this.pos_y = pos_y;
  }
  
  public void set_size(long size){
      this.size = size;
  }
  
  public void set_text(String text){
      this.text = text;
  }
  public void move_right(int inc_move){
    this.pos_x = this.pos_x + inc_move;
  }
  
  public void show(){
    
    /*if(!shown)
      fill(255,0, 0,1);
    else{
      fill(255, 0, 0, 2);
      //rect(this.pos_x, this.pos_y-this.size-2, 100,this.size+2);
      //rect(0, 410, 800,40);
    }*/
    
    int R = round(random( 0, 255));
    
    fill(R,0, 0, 1);
    shown = true;
    
    smooth(120);
    textSize(this.size);
    //text(this.text, this.pos_x, this.pos_y);
    text(this.text, this.pos_x, this.pos_y);
  }

}
