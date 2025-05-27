import std.stdio;
import std.string;

void main() {
    char[3][3] board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']];
    bool playerOneMove = true;
    bool gameOver = mainMenu();

    while (!gameOver) {
        print(board);
        int x, y;
        write("x:_ ");
        readf(" %d", &x);
        write("y:_ ");
        readf(" %d", &y);

        if (x >= 0 && x < 3 && y >= 0 && y < 3) {
            if (board[y][x] == ' ') {
                board[y][x] = playerOneMove ? 'x' : 'o';
                playerOneMove = !playerOneMove;
            } else {
                writeln("\n*********************************************");
                writeln("Position ", x, ",", y, " is occupied! Try again.");
                writeln("*********************************************");
            }
        } else {
            writeln("Invalid position! Try values between 0 and 2.");
        }

        check(board, gameOver);
    }

    print(board);
    if (playerOneMove)
        writeln("Player O won");
    else
        writeln("Player X won");

    writeln("Bye Bye!");
}

bool mainMenu() {
    writeln("Hello!");
    writeln("(1) Play");
    writeln("(2) Exit");
    write(":_ ");
    string line = strip(readln());
    return !(line == "play" || line == "Play" || line == "1" || line == "p");
}

void print(char[3][3] array) {
    writeln("\n  0       1       2");
    writeln(" ---------------------");
    for (int i = 0; i < array.length; i++) {
        write(i, " |");
        for (int j = 0; j < array[i].length; j++) {
            write("  ", array[i][j], "  |");
        }
        writeln("\n ---------------------");
    }
    writeln();
}

void check(char[3][3] array, ref bool gameOver) {
    for (int i = 0; i < 3; i++) {
        // Row
        if (array[i][0] != ' ' && array[i][0] == array[i][1] && array[i][1] == array[i][2])
            gameOver = true;
        // Column
        if (array[0][i] != ' ' && array[0][i] == array[1][i] && array[1][i] == array[2][i])
            gameOver = true;
    }

    // Diagonals
    if (array[0][0] != ' ' && array[0][0] == array[1][1] && array[1][1] == array[2][2])
        gameOver = true;
    if (array[0][2] != ' ' && array[0][2] == array[1][1] && array[1][1] == array[2][0])
        gameOver = true;
}
