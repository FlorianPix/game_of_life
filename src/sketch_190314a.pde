int rows = 200;
int columns = 200;
int resolution = 10;
int w = 10;
int x, y;
boolean set = true;
Grid grid, next;

void setup(){
  size(1000, 1000);
  grid = new Grid(rows, columns);
}

void draw(){
  background(0, 102, 102);
  fill(153, 0, 51);
  if (keyPressed){
      if (set){
        set = false;
      }
      else{
        set = true;
      }
    }
  if (set){
    if (mousePressed){
      x = (int) Math.floor(mouseX);
      y = (int) Math.floor(mouseY);
      grid.grid[x/resolution][y/resolution].revive();
    }
    for (int i = 0; i < columns; i++){
      for (int j = 0; j < rows; j++){
        if (grid.grid[i][j].getStatus() == 1) {
          rect(i * resolution, j * resolution, w, w);
        }
      }
    }
  }
  else{
    update();
  }
}

void update(){
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      if (grid.grid[i][j].getStatus() == 1) {
        rect(i * resolution, j * resolution, w, w);
      }
    }
  }
  next = grid;
  int count = 0;
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      // Count neighbors
      count = grid.getNeighbors(i, j);
      if (count > 3 || count < 2){
        next.grid[i][j].kill();
      }
      if (count == 3){
        next.grid[i][j].revive();
      }
    }
  } 
  grid = next;
}
