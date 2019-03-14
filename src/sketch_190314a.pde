int rows = 40;
int columns = 40;
int resolution = 25;
int w = 25;
Grid grid, next;

void setup(){
  size(1000, 1000);
  grid = new Grid(rows, columns);
  //print(grid);
}

void draw(){
  background(0, 102, 102);
  fill(153, 0, 51);
  for (int i = 0; i < columns; i++){
    for (int j = 0; j < rows; j++){
      if (grid.grid[i][j].getStatus() == 1) {
        rect(i * resolution, j * resolution, w, w, 5);
      }
    }
  }
  
  next = grid;
  
  int count = 0;
  for (int i = 0; i < columns - 1; i++){
    for (int j = 0; j < rows - 1; j++){
      // Count neighbors
      count = grid.getNeighbors(i, j);
      if (count > 3 || count < 2){
        next.grid[i][j].kill();
      }
      else{
        next.grid[i][j].revive();
      }
    }
  }
  
  grid = next;
}
