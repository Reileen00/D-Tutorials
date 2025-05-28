import data;
import raylib;
import std.conc:to;
void main(){
    validityRayLibBinding();
    InitWindow(WIDTH,HEIGHT,"Dlang TTT");
    SetTargetFPS(30);
    SetMouseScale(1.0,1.0);
    Texture2D tcross=LoadTexture("res/cross.png");
    texture2D tnought=LoadTexture("res/nought.png");
    Square[3][3] squares;
    for(int i=0;i<squares.length;i++){
        for(int j=0;j<squares[i].length;j++){
            squares[i][j]=Square(Rectangle(i*SIZE,j*SIZE,SIZE,SIZE));
        }
    }
    bool playersMove=true;
    bool draw=false;
    bool gameOver=false;
    int empty_squares=9;
    while(!WindowShouldClose()){
        Vector2 mousePos=GetMousePosition();
        if(squares[0][0].type!=' ' && squares[0][0].type==squares[0][1].type && squares[0][1].type==squares[0][2].type)
         {gameOver=true;}
        if(squares[1][0].type!=' ' && squares[1][0].type==squares[1][1].type && squares[1][1].type==squares[1][2].type)
         {gameOver=true;}
        if(squares[2][0].type!=' ' && squares[2][0].type==squares[2][1].type && squares[2][1].type==squares[2][2].type)
         {gameOver=true;}
        if(squares[0][1].type!=' ' && squares[0][1].type==squares[1][1].type && squares[1][1].type==squares[2][1].type)
         {gameOver=true;}
        if(squares[0][2].type!=' ' && squares[0][2].type==squares[1][2].type && squares[1][2].type==squares[2][2].type)
         {gameOver=true;}
        if(squares[0][0].type!=' ' && squares[0][0].type==squares[1][1].type && squares[1][1].type==squares[2][2].type)
         {gameOver=true;}
        if(squares[2][0].type!=' ' && squares[2][0].type==squares[1][1].type && squares[1][1].type==squares[0][2].type)
         {gameOver=true;}
        if(empty_squares<1 && !gameOver)draw=true;
     
    if(IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT)||IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT)){
        int i=to!int(mousePos.x/SIZE);
        int j=to!int(mousePos.y/SIZE);

        if(squares[i][j].type==' '){
            if(playerMove){
                squares[i][j].tex=tcross;
                squares[i][j].type='x';
            }
            else{
                squares[i][j].tex=tnought;
                squares[i][j].type='o';
            }
            empty_squares--;
            playersMove=!playersMove;
        }
    }
    BeginDrawing();
    ClearBackground(Color(0,179,255,255));
    drawGrid();
    for(int i=0;i<squares.length;i++){
        for(int j=0;j<squares[i].length;j++){
            squares[i][j].draw();
        }
    }
    if(draw) { 		// if the game is a draw
			DrawRectangleRec(Rectangle(0, 0, WIDTH, HEIGHT), Color(0, 0, 0, 160));
			DrawText("It's a draw!", WIDTH/16, HEIGHT*2/5, 60, Colors.WHITE);
		} else if(gameOver) { 	// if somebody has won
			DrawRectangleRec(Rectangle(0, 0, WIDTH, HEIGHT), Color(0, 0, 0, 160));
			DrawText("You won!", WIDTH/8, HEIGHT*2/5, 70, Colors.WHITE);
		}

		EndDrawing();
	}

	// free memory
	UnloadTexture(tcross);
	UnloadTexture(tnought);

	// quit
	CloseWindow();
}
