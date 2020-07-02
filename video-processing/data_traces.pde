  
 long line_x0 = 50;
 long x =line_x0;
 long size_w = 800;
 long size_h = 350;
 ArrayList<signal> signals = new ArrayList<signal>();
 ArrayList<message> messages = new ArrayList<message>();
 
 import ddf.minim.*;
 import processing.sound.*;
 
 Minim minim;
 AudioPlayer madu;
 
 data mydata = null;
 PImage bg;
 
 SoundFile file;
 
 void setup(){
   
   size(800, 450);
   
   mydata = new data("/Users/rempicon/Google_Drive/MYCODE/PRJ/GIT/SpaceAppsCOVIDChallenge/data/OMNO2d003_2020_01_06_milan.csv");
  
   background(0, 0,0);
   //background(255, 255,255);
   
   minim = new Minim(this);
   madu = minim.loadFile("/Users/rempicon/Google_Drive/MYCODE/PRJ/GIT/SpaceAppsCOVIDChallenge/sounds/madunina.mp3");
   madu.loop();
   
   //file = new SoundFile(this, "madunina.mp3");
   //file.play();
   //bg = loadImage("/Users/rempicon/Google_Drive/MYCODE/PRJ/GIT/SpaceAppsCOVIDChallenge/imgs/milan_sky_800_450_2.jpg");
   background(10,0,0);
 }

long count = 1;
long xx = 0;

 void draw(){
   

   //background(0, 0,0);
   
   //if(count % 200 ==0)
      //background(100, 50,0);
   
   
   // receive new signals and messages
   int interval = round(random(10,100)); 
   
   if(count % interval == 0){
     //background(bg);
     //background(0, 0,0);
     //background(255, 255,255);
     
     // in a single period there can be more signals 
     ArrayList<signal> new_signals = mydata.next();
     // add the different signals to the array of signals
     for(int i=0; i<new_signals.size();i++){
  
       signals.add(new_signals.get(i));
       
       
     }
     
     String y = String.valueOf(mydata.year);
     String m = String.valueOf(mydata.month);
     String d = String.valueOf(mydata.day);
     
     
      //<>//
     if(new_signals.size()>0){
       //String date = String.format("%d/%d N02:%s", mydata.year,mydata.month, nf(mydata.value_mn, 1, 2) );
       //String date = String.format("%d/%d", mydata.year,mydata.month);
       
       String smonth = "";
       if(mydata.month == 1)
         smonth = "JAN";
       if(mydata.month == 2)
         smonth = "FEB";
         
       if(mydata.month == 3)
         smonth = "MAR";
         
       if(mydata.month == 4)
         smonth = "APR";
        
       if(mydata.month == 5)
         smonth = "MAY";
         
       String date = String.format("0%d/%d", mydata.month, mydata.day);
       messages.add(new message(date, 0, 330, 400));
     }
     
     //textSize(10);
     //text("N02", 390, 220);
     //count = 0;
     
   }
   
   
   // show signals 
   for(int i=0; i<signals.size();i++){
     
     if(signals.get(i).isactive()){
       signals.get(i).change_sizeh_inc();
       signals.get(i).change_sizew_inc();
       signals.get(i).move_right(1);
       signals.get(i).show();
       
       
       //line(0,225,800,225);
       
       //int size_inc_x = (int) signals.get(i).get_size_inc_x();
       
       int interval2 = round(random(1,5));
       
       if(count % interval2 ==0){
         //background(100, 20,50);
         int size_inc_x = (int) signals.get(i).get_size_inc_x();
         int size_inc_y = (int) signals.get(i).get_size_inc_y();
         
         
         
         float switch_x = (random(-1,1));
         float switch_y = (random(-1,1));
         int x = round(switch_x*size_inc_x);
         int y = round(switch_y*size_inc_y);
         if(x!=0 && y!=0){
           signals.get(i).set_size_inc_x(x);
           signals.get(i).set_size_inc_y(y);
         }
         
         
         int sk = round(map(signals.get(i).val_sign, 0,1, 0, 20));
         madu.skip(sk);
         
       }
     }
   }// show signals
   
   // show messages
   /*if(count%300==0)
   for(int i=0; i<messages.size();i++){
      messages.get(i).show();
      //messages.get(i).move_right(500);
   }
   */
   
   if(count%1==0){
   String mm = "";
   String dd = "";
   
   if(mydata.month == 1)
     mm = "JAN";
   if(mydata.month == 2)
     mm = "FEB";
     
   if(mydata.month == 3)
     mm = "MAR";
     
   if(mydata.month == 4)
     mm = "APR";
    
   if(mydata.month == 5)
     mm = "MAY";
   
   if(mydata.day<10)
     dd = String.format("0%d", mydata.day);
   else
     dd = String.format("%d", mydata.day);
   
   if (mydata.day==0)
     dd = "01";
   
   int mmm = mydata.month;
   if (mydata.month==0)
     mmm= 1;
     
   String date = String.format("0%d.%s", mmm, dd);
   message m = new message(date, 10, 320, 280);
   m.show();
   }
   
   
   saveFrame("/Users/rempicon/Google_Drive/MYCODE/PRJ/GIT/SpaceAppsCOVIDChallenge/frames/10/dt_####.pgm");
   count++;
   
  
 }
