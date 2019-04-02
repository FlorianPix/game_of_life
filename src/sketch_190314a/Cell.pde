import java.util.Random;

class Cell{
  int status;
  
  Cell(){
    Random rand = new Random();
    this.status = rand.nextInt(2);
  }
  
  Cell(int status){
    if (status < 0 || status > 1) {
      throw new IllegalArgumentException();
    }  
    this.status = status; 
  }
  
  public void setStatus(int status){
    if (status < 0 || status > 1) {
      throw new IllegalArgumentException();
    }  
    this.status = status;
  }
  
  public void kill(){
    this.status = 0;
  }
  
  public void revive(){
    this.status = 1;
  }
  
  public int getStatus(){
    return this.status;
  }
  
  @Override
  public String toString(){
    return String.valueOf(this.status);
  }
}
