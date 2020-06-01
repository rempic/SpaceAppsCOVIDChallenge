  
 
 int size_w = 1000;
 int size_h = 1000;
 
 void setup(){
   size(1000, 1000);
 }
 

 int line_x0 = 300;
  int x =line_x0;
  
 void draw(){
  
   background(50, 24, 100);
   rect(x,10,10,10);
   line(line_x0,0,line_x0,size_w);
   x++;
  
 }
