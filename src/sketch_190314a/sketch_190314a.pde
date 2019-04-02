import java.util.concurrent.TimeUnit;

int rows = 50;
int columns = 50;
int resolution = 20;
int w = 20;
int c = 3;
int x, y;
long delay = 60;
boolean set = true;
Grid grid, next;

void setup(){
  size(1000, 1000);
  this.grid = new Grid(rows, columns);
}

void draw(){
  background(0, 100, 100);
  fill(153, 0, 51);
  if (keyPressed){
      if (set && (key == 's' || key == 'S')){
        set = false;
      }
      if (!set && (key == 'd' || key == 'D')){
        set = true;
      }
    }
  if (set){
    if (mousePressed && (mouseButton == LEFT)){
      x = (int) Math.floor(mouseX);
      y = (int) Math.floor(mouseY);
      if (x/resolution < this.columns && y/resolution < this.rows){
        this.grid.grid[x/resolution][y/resolution].revive();
      }
    }
    if (mousePressed && (mouseButton == RIGHT)){
      x = (int) Math.floor(mouseX);
      y = (int) Math.floor(mouseY);
      if (x/resolution < this.columns && y/resolution < this.rows){
        this.grid.grid[x/resolution][y/resolution].kill();
      }
    }
    for (int i = 0; i < columns; i++){
      for (int j = 0; j < rows; j++){
        if (this.grid.grid[i][j].getStatus() == 1) {
          fill(153, 0, 51);
          rect(i * resolution, j * resolution, w, w, c);
        }
        else{
          fill(0, 0, 0);
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
