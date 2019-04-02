import java.util.concurrent.TimeUnit;

int rows = 100;
int columns = 100;
int resolution = 10;
int w = 10;
int c = 3;
int x, y;
long delay = 0;
boolean set = true;
Grid grid, next;

void setup(){
  size(1000, 1000);
  this.grid = new Grid(rows, columns);
}

void draw(){
  background(0, 102, 102);
  fill(153, 0, 51);
  if (keyPressed){
      if (set){
        set = false;
        try        
        {
          TimeUnit.SECONDS.sleep(1);
        }catch(InterruptedException ex) {}
      }
      else{
        set = true;
        try        
        {
          TimeUnit.SECONDS.sleep(1);
        }catch(InterruptedException ex) {}
      }
    }
  if (set){
    if (mousePressed){
      x = (int) Math.floor(mouseX);
      y = (int) Math.floor(mouseY);
      this.grid.grid[x/resolution][y/resolution].revive();
    }
    for (int i = 0; i < columns; i++){
      for (int j = 0; j < rows; j++){
        if (this.grid.grid[i][j].getStatus() == 1) {
          rect(i * resolution, j * resolution, w, w, c);
        }
      }
    }
  }
  else{
    try{
      TimeUnit.MILLISECONDS.sleep(delay);
    }catch(InterruptedException ex) {}
    //println(this.grid.showNeighbors());
    update();
  }
}

void update(){
  next = this.grid;
  int count = 0;
  Grid kill = new Grid(rows, columns);
  Grid revive = new Grid(rows, columns);
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      // Count neighbors
      count = this.grid.getNeighbors(i, j);
      if (count > 3 || count < 2){
        kill.grid[i][j].setStatus(1);
      }
      if (count == 3){
        revive.grid[i][j].setStatus(1);
      }
    }
  }
  //println("kill \n" + kill);
  //println("revive \n" + revive);
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      if (kill.grid[j][i].getStatus() == 1){
        next.grid[i][j].kill();
        //println("kill " + j + " " + i);
      }
      if (revive.grid[j][i].getStatus() == 1){
        next.grid[i][j].revive();
        //println("revive " + j + " " + i);
      }
    }
  }
  
  this.grid = next;
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      if (this.grid.grid[i][j].getStatus() == 1) {
        rect(i * resolution, j * resolution, w, w, c);
      }
    }
  }
}
