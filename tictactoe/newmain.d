import std.stdio;
import std.string;
import std.conv;
import std.ascii;

void main() {
    char[3][3] board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']];
    bool playerOneMove = true;
    bool gameOver = mainMenu();

    while (!gameOver) {
        print(board);
        char x, y;

        write("x:_ ");
        readf(" %c", &x);

        write("y:_ ");
        readf(" %c", &y);

        if (checkdigit(x) && checkdigit(y)) {
            int X = to!int(x - '0');
            int Y = to!int(y - '0');

            if (X >= 0 && X < 3 && Y >= 0 && Y < 3) {
                if (board[Y][X] == ' ') {
                    board[Y][X] = playerOneMove ? 'x' : 'o';
                    playerOneMove = !playerOneMove;
                } else {
                    writeln("\n***********************************************");
                    writeln("Position ", x, ",", y, " is occupied! Try again.");
                    writeln("***********************************************");
                }
            } else {
                writeln("Invalid input: coordinates must be between 0 and 2.");
            }
        }

        check(board, gameOver);
    }

    print(board);
    if (playerOneMove)
        writeln("Player O won");
    else
        writeln("Player X won");
}

// Check if input is digit
bool checkdigit(char arg) {
    if (isDigit(arg))
        return true;
    writeln("\nError: arg (", arg, ") is not a digit! Try again.");
    return false;
}

// Game menu
bool mainMenu() {
    writeln("Hello!");
    writeln("(1) Play");
    writeln("(2) Exit");
    write(":_ ");
    string line = strip(readln());
    return !(line == "play" || line == "Play" || line == "1" || line == "p");
}

// Print the board
void print(char[3][3] array) {
    writeln("\n\t0\t1\t2");
    writeln("_________________________________________________");
    for (int i = 0; i < array.length; i++) {
        write(i, " |");
        for (int j = 0; j < array[i].length; j++) {
            write("\t", array[i][j], "\t|");
        }
        writeln();
        writeln("_________________________________________________");
    }
    writeln();
}

// Check win conditions
void check(char[3][3] array, ref bool gameOver) {
    // Check rows
    for (int i = 0; i < array.length; i++) {
        if (array[i][0] != ' ' && array[i][0] == array[i][1] && array[i][1] == array[i][2]) {
            gameOver = true;
            return;
        }
    }

    // Check columns
    for (int i = 0; i < array.length; i++) {
        if (array[0][i] != ' ' && array[0][i] == array[1][i] && array[1][i] == array[2][i]) {
            gameOver = true;
            return;
        }
    }

    // Check diagonals
    if (array[0][0] != ' ' && array[0][0] == array[1][1] && array[1][1] == array[2][2]) {
        gameOver = true;
        return;
    }

    if (array[2][0] != ' ' && array[2][0] == array[1][1] && array[1][1] == array[0][2]) {
        gameOver = true;
        return;
    }
}
