import java.lang.Math;

class Grid{
   Cell[][] grid;
   int height;
   int width;
   
   Grid(int height, int width){
     this.height = height;
     this.width = width;
     grid = new Cell[height][width];
     for (int i = 0; i < height; i++){
       for (int j = 0; j < width; j++){
         grid[i][j] = new Cell(0);
       }
     }
   }
   
   public int getNeighbors(int x, int y){
     if (x >= this.width)throw new IllegalArgumentException();
     if (y >= this.height)throw new IllegalArgumentException();
     int count = 0;
     int left = Math.floorMod((x - 1), this.width);
     int midX = x;
     int right = Math.floorMod((x + 1), this.width);

     int up = Math.floorMod((y + 1), this.height);
     int midY = y;
     int down = Math.floorMod((y - 1), this.height);
     
     if (grid[left][up].getStatus() == 1){
       count++;
     }
     if (grid[left][midY].getStatus() == 1){
       count++;
     }
     if (grid[left][down].getStatus() == 1){
       count++;
     }
     if (grid[midX][up].getStatus() == 1){
       count++;
     }
     if (grid[midX][down].getStatus() == 1){
       count++;
     }
     if (grid[right][up].getStatus() == 1){
       count++;
     }
     if (grid[right][midY].getStatus() == 1){
       count++;
     }
     if (grid[right][down].getStatus() == 1){
       count++;
     }
     return count;
   }
   
   @Override
   public String toString(){
     String result = "";
     for (int i = 0; i < this.height; i++){
       result = result + "\n";
       for (int j = 0; j < this.width; j++){
         result = result + " " + grid[i][j];
       }
     }
     return result;
   }
}
