//********************************************************* //<>//  //<>//
//                        PARAMETERS
//*********************************************************
// Nombre de colonnes et de lignes
int cols = 100;
int rows = 100;

int cnt = 0;

// 2D Array
Node[][] grid = new Node[cols][rows];

// Start, end et current
Node start;
Node end;
Node current;

// Open and closed set
// A besoin de import java.util.*;
List<Node> openSet = new ArrayList<Node>();
List<Node> closedSet = new ArrayList<Node>();

// Le chemin directeur
List<Node> path = new ArrayList<Node>();

// Width et Height de chaque cellule de la grille
int w, h;

// Affiche la grille quand le goal a été atteint
boolean end_b = false;

//*********************************************************
//                          SETUP
//*********************************************************
void setup() {
  size(900, 900);

  w = width/cols;
  h = height/rows;

  createAllNodes();
  addAllNeighbors();

  // Start et End position, random position
  start = grid[(int)random(cols/2, cols/2)][(int)random(rows/2, rows/2)];
  end = grid[(int)random(0, cols-1)][(int)random(0, rows-1)];
  start.wall = false;
  end.wall = false;

  // openSet commence avec le noeud Start uniquement
  openSet.add(start);

  println("Début BTS - Breadth First Search");
}


//*********************************************************
//                           DRAW
//*********************************************************
void draw() {
  background(255);
  //*******************************************************
  //                     CALCUL PART
  //*******************************************************
  BFS();


  //*******************************************************
  //                     DISPLAY PART
  //*******************************************************
  if (end_b) {
    showGrid();
  }
  showWall(); 
  showSet();
  showPath();

  start.showSetColor(color(255, 0, 255));
  end.showSetColor(color(255, 0, 255));
  start.showText("Start");
  end.showText("End");

  noFill();
  stroke(0);
  strokeWeight(1);
}

//*********************************************************
//                        FUNCTIONS
//*********************************************************
//*********************************************************
// Create all Nodes
void createAllNodes() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Node(i, j);
    }
  }
}


//*********************************************************
// Add all neighbors
void addAllNeighbors() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].addNeighbors(grid);
    }
  }
}

//*********************************************************
// Affiche la grille avec le nbr de cols & rows donnés
void showGrid() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      rect(i*w, j*h, w, h);
    }
  }
}


//*********************************************************
// Affiche les murs du labyrinthe, chaque mur possède 40% de 
// chance de l'être
// int num = Nbr entre 0 et 100. 
void showWall() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show();
    }
  }
}


//*********************************************************
// Affiche openSet and closedSet en vert et rouge respectivement
void showSet() {
  for (int i = 0; i < closedSet.size(); i++) {
    closedSet.get(i).showSetColor(color(255, 0, 0, 90));
  }
  for (int i = 0; i < openSet.size(); i++) {
    openSet.get(i).showSetColor(color(0, 255, 0, 90));
  }
}

//*********************************************************
// Affiche openSet and closedSet en vert et rouge respectivement
void showPath() {
  // Trouve le chemin en le refaisant à l'envers
  List<Node> path = new ArrayList<Node>();
  Node temp = current;
  path.add(temp);
  while (temp.previous != null) {
    path.add(temp.previous);
    temp = temp.previous;
  }
  noFill();
  stroke(255, 0, 200);
  strokeWeight(w / 3);
  beginShape();

  // Pour avoir les points du chemin dans le bon ordre
  for (int i = 0; i < path.size(); i++) {
    if (end_b) {
      cnt++;
    }
  }

  // Obtenir les coordonées du chemin dans le bon ordre
  for (int i = 0; i < path.size(); i++) {
    vertex(path.get(i).x * w + w / 2, path.get(i).y * h + h / 2);
    if (end_b) {
      println("Point n°" + cnt + " --> x = " + path.get(i).x + ", y = " + path.get(i).y);
      cnt--;
    }
  }
  if (end_b) println("END BTS - Breadth First Search");
  endShape();
}

void BFS() {
  if (openSet.size() > 0) {
    current = openSet.get(0);
    current.visited = true;

    if (current == end) {
      // On a trouvé le goal, on stop!!!
      end_b = true;
      println("DONE !!! Goal has been found");
      noLoop();
    }

    openSet.remove(current);
    closedSet.add(current);

    // Vérifie chaque voisin
    List<Node> neighbors = current.neighbors;
    for (int i = 0; i < neighbors.size(); i++) {
      Node neighbor = neighbors.get(i);
      // Est-ce un meilleur chemin que le precedent?
      boolean newPath = false;
      if (closedSet.contains(neighbors) && !neighbor.wall ) {
        //Le noeud a déjà été vérifié, on passse au suivant
      } else if (!closedSet.contains(neighbors) && !neighbor.wall) {
        if (!openSet.contains(neighbor)&& !neighbor.visited) {
          openSet.add(neighbor);
          newPath = true;
        }
      }
      if (newPath) {
        neighbor.previous = current;
      }
    }
  } else {
    println("No solutions!");
    noLoop();
  }
}
