import java.util.*;

class Node {
  //*********************************************************
  //                        PARAMETERS
  //*********************************************************
  // Position du noeud
  int x;
  int y;

  // Boolean qui indique si la case fait partie du labyrinthe 
  //(TRUE) ou non (FALSE)
  boolean wall = false;


  List<Node> neighbors = new ArrayList<Node>();

  // D'où viens-je?
  Node previous = null;
  
  // Ai-je déjà été visité?
  boolean visited = false;


  //*********************************************************
  //                        CONSTRUCTOR
  //*********************************************************
  Node(int x_, int y_) {
    x = x_;
    y = y_;

    // 39%  de chance que ce node soit un mur du labyrinthe
    wall = false;
    if (random(100) < 39) {
      wall = true;
    }
    
    boolean visited = false;
  }


  //*********************************************************
  //                        FUNCTIONS
  //*********************************************************
  //*********************************************************
  // Permet d'afficher le mur du labyrinthe
  void show() {
    if (wall == true) {
      fill(0);
      stroke(0);
      strokeWeight(1);
      rect(x*w, y*h, w, h);
    }
  }

  //*********************************************************
  void showSetColor(color col) {
    if (wall == false) {
      strokeWeight(1);
      fill(col);
      rect(x*w, y*h, w, h);
    }
  }

  //*********************************************************
  void showText(String text) {
    if (wall == false) {
      textSize(1.5*w);
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      text(text, x *w, y*h - 0.7*h);
    }
  }

  //*********************************************************
  // Qui est mon voisin ? Je suis à la cellule X
  // 5  3  7
  // 2  X  1
  // 6  4  8

  void addNeighbors(Node[][] grid) {
    if (x < cols - 1 && visited == false) { //1 
      neighbors.add(grid[x+1][y]);
    }
    if (x > 0 && visited == false) { //2
      neighbors.add(grid[x-1][y]);
    }
    if (y > 0 && visited == false) { //3
      neighbors.add(grid[x][y-1]);
    }
    if (y < rows - 1 && visited == false) { //4
      neighbors.add(grid[x][y+1]);
    }
    // Ajouter les diagonales lors de la recherche de voisins ?
    //if (x > 0 && y > 0) { //5
    //  neighbors.add(grid[x-1][y-1]);
    //}
    //if (x < cols - 1 && y > 0) { //6
    //  neighbors.add(grid[x+1][y-1]);
    //}
    //if (x > 0 && y < rows - 1 ) { //7
    //  neighbors.add(grid[x-1][y+1]);
    //}
    //if (x < cols - 1 && y < rows - 1) { //8
    //  neighbors.add(grid[x+1][y+1]);
    //}
  }
}
