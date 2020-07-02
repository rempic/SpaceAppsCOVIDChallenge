
import java.util.Iterator;

public class data{
  
  private Table table = null;
  private String filename = "";
  private Iterator table_iterator = null;
  
  private String product_shortname = "";
  private String signal_name = "";
  private String loc_name = "";
  private Float value_mn = 0.0;
  private Float value_sd =0.0;
  public int year = 0;
  public int month = 0;
  public int day = 0;
  
  private String product_shortname_next = "";
  private String signal_name_next = "";
  private String loc_name_next = "";
  private Float value_mn_next = 0.0;
  private Float value_sd_next =0.0;
  public int year_next = 0;
  public int month_next = 0;
  public int day_next = 0;
  
  public int hour = 0;
  public int minutes = 0;
  public int seconds = 0;
  private color[] colors = new color[10];
  private long size_h_max = 450;
  private long size_w_max = 800;
  
  public data(String filename){
    
    this.filename =filename;
    
    this.table = loadTable(filename, "header");
    
    table_iterator = table.rows().iterator();
    
    this.assign_row((TableRow) table_iterator.next());
    
  }
  

  
  private void assign_row(TableRow row){
    
    this.product_shortname = this.product_shortname_next;
    this.signal_name = this.signal_name_next;
    this.loc_name = this.loc_name_next;
    this.value_mn = this.value_mn_next;
    this.value_sd = this.value_sd_next;
    this.year = this.year_next;
    this.month = this.month_next;
    this.day = this.day_next;
    
    this.product_shortname_next = row.getString("product_name");
    this.signal_name_next = row.getString("signal_name");
    this.loc_name_next = row.getString("loc_name");
    this.value_mn_next = row.getFloat("value_mn_rescale");
    this.value_sd_next = row.getFloat("value_sd");
    this.year_next = row.getInt("year");
    this.month_next = row.getInt("month");
    this.day_next = row.getInt("day");
    //this.hour = row.getInt("hour");
    //this.minutes = row.getInt("minutes");
    //this.seconds = row.getInt("seconds");
    
  }
  
  
  public ArrayList<signal> next(){
    
    long y0 =0;
    long m0 =0;
    long d0 =0;
    long y1 =0;
    long m1 =0;
    long d1 =0;
    
    ArrayList<signal> signals = new ArrayList<signal>(); //<>//
    ArrayList<message> messages = new ArrayList<message>();
    
    while(true){ //<>//
      
      if (this.value_mn_next > 0.1){
        signal newsignal = new signal(size_h_max, size_w_max);
        int new_pos = round(map(this.value_mn_next, 0,1, 50,400));
        
        newsignal.set_posy(225);
        
        newsignal.val_sign = this.value_mn_next;
        
        int new_sizeinc_x = round(map(this.value_mn_next, 0,1, 0, 10));
        int new_sizeinc_y = round(map(this.value_mn_next, 0,1, 10, 100));
       
        newsignal.set_size_inc_x(new_sizeinc_x);
        newsignal.set_size_inc_y(new_sizeinc_y);
        
        int R = 0;
        int new_col = round(random( 10, 25));
        int new_col2 = round(random( 5, 20));
        
        // black modulator, used to show/hide more features when the level of pollution is high/low
        int upper = round(map(this.value_mn_next, 0,1, 1,50));
        
        if (round(random( 0, 100))>upper){
          new_col =round(random( 10, 15));
          R =round(random(0, 10));
          newsignal.set_size_lock(true);
          
          newsignal.set_sizew(round(random( 10, 30)));
          newsignal.set_sizeh(1000); 
          //newsignal.set_color(R, 0, 0);
        }
        
        newsignal.set_color(R, new_col, new_col2);
        
        /* // to change color with different names String loc_name = this.loc_name;
        int c1 = (int) loc_name.charAt(0);
        int c2 = (int) loc_name.charAt(1);
        int c3 = (int) loc_name.charAt(2);
        
        c1 = round(map(c1, 65, 122, 0,255));
        c2 = round(map(c2, 65, 122, 0,255));
        c3 = round(map(c3, 65, 122, 0,255));
        
        newsignal.set_color(c2,c1,c3);
        */
        
        if(newsignal!=null)
          signals.add(newsignal);
        
      }
      
     // create message if it is in the db  
     //if(){
     //   if(newmessage1!=null)
     //     messages.add(newmessage);
      //}
    
      TableRow row = (TableRow) table_iterator.next();
      
      //current date
      y0 = this.year;
      m0 = this.month;
      d0 = this.day;
      
      // new data
      y1 = row.getInt("year");
      m1 = row.getInt("month");
      d1 = row.getInt("day");
      
      this.assign_row(row);
      
      if(!(y0==0 && m0==0 && d0==0) && !( y0==y1 && m0==m1 && d0==d1) && (this.value_mn_next>0))
        break;
    }
     
     
    return signals;
    
  }
  
}
