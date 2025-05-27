import std.stdio;
import std.string;

void main(){
  char [3][3] board=' ';
  bool playerOneMove=true;
  bool gameOver=mainMenu();
  while(!gameOver){
    print(board);
    int x=0;
    write("x:_");
    readf("%s",x);
    int y=0;
    write("y:_");
    readf("%s",y);
    if(board[y][x]==' '){
      if(playerOneMove)board[y][x]='x';
      else board[y][x]='o';
      playerOnemove=!playerOneMove;
    }
    else{
      writeln();
      writeln();
      writeln("*********************************************");
      writeln("Position ",x,",",y," is occupied! try again.");
      writeln("*********************************************");
    }
    check(board,gameOver);
  }
  print(board);
  if(playerOneMove)writeln("Player O won");
  else println("Player X won");
  writeln("Bye Bye!");
}
bool mainMenu(){
  writeln("Hello!");
  writeln("(1)Play");
  writeln("(2)Exit");
  writeln(":_");
  string line=strip(readln());
  if(line=="play"||line=="Play"||line=='1'||line=="p")return false;
  return true;
}
void print(char[3][3] array ){
  writeln();
  writeln();
  for(int i=0;i<array.length;i++)write(i);
  writeln();
  writeln("-----------------------------------------");
  for(int i=0;i<array.length();i++){
    write(i);
    for(int j=0;j<array[i].length;j++){
      write("          |           ",array[i][j]);
    }
    writeln();
    writeln("------------------------------------------");
  }
  writeln();
  writeln();
}
void check(char[3][3] array,ref bool gameOver){
  for(int i=0;i<array.length;i++){
    if(array[i][0]!=' '&& array[i][1]!=' ' && array[i][2]!=' '){
      if(array[i][0]==array[i][1] && array[i][1]==array[i][2])gameOver=true;
    }
  }
  for(int i=0;i<array.length;i++){
    if(array[0][i]!=' '&& array[1][i]!=' ' && array[2][i]!=' '){
      if(array[0][i]==array[1][i] && array[1][i]==array[2][i])gameOver=true;
    }
  }
  for(int i=0;i<array.length;i++){
    if(array[0][0]!=' '&& array[1][1]!=' ' && array[2][2]!=' '){
      if(array[0][0]==array[1][1] && array[1][1]==array[2][2])gameOver=true;
    }
  }
  for(int i=0;i<array.length;i++){
    if(array[2][0]!=' '&& array[1][1]!=' ' && array[0][2]!=' '){
      if(array[2][0]==array[1][1] && array[1][1]==array[0][2])gameOver=true;
    }
  }
  
}
