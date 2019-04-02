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
     int left = Math.floorMod((y - 1), this.height);
     int midX = y;
     int right = Math.floorMod((y + 1), this.height);

     int up = Math.floorMod((x + 1), this.width);
     int midY = x;
     int down = Math.floorMod((x - 1), this.width);
     
     //links oben
     if (grid[left][up].getStatus() == 1){
       count++;
     }
     //links
     if (grid[left][midY].getStatus() == 1){
       count++;
     }
     //links unten
     if (grid[left][down].getStatus() == 1){
       count++;
     }
     //oben
     if (grid[midX][up].getStatus() == 1){
       count++;
     }
     //unten
     if (grid[midX][down].getStatus() == 1){
       count++;
     }
     //rechts oben
     if (grid[right][up].getStatus() == 1){
       count++;
     }
     //rechts
     if (grid[right][midY].getStatus() == 1){
       count++;
     }
     //rechts unten
     if (grid[right][down].getStatus() == 1){
       count++;
     }
     return count;
   }
   
   public String showNeighbors(){
     String result = "";
     for (int i = 0; i < this.height; i++){
       result = result + "\n";
       for (int j = 0; j < this.width; j++){
         result = result + " " + getNeighbors(i, j);
       }
     }
     return result;
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
