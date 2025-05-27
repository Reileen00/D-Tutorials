import std.stdio;
import std.conv;
import std.random;

enum GameState {
    MENU, PLAY, HELP, EXIT
}

enum int NUM_SHIPS = 5;

immutable int NUM_STEPS = 10;

void main() {
    GameState gameState = GameState.MENU;
    while (gameState != GameState.EXIT) {
        if (gameState == GameState.MENU) mainMenu(gameState);
        else if (gameState == GameState.HELP) help(gameState);
        else if (gameState == GameState.PLAY) gamePlay(gameState);
    }
    writeln("Bye Bye");
}

void clear() {
    foreach (i; 0 .. 30)
        writeln();
}

void mainMenu(ref GameState gameState) {
    clear();
    writeln("HELLOOO!");
    writeln();
    writeln("(1) PLAY");
    writeln("(2) HELP");
    writeln("(3) EXIT");
    writeln();
    write("Choice >> :_ ");

    char c;
    readf(" %c", &c);
    if (c == '1') gameState = GameState.PLAY;
    else if (c == '2') gameState = GameState.HELP;
    else gameState = GameState.EXIT;
}

void help(ref GameState gameState) {
    clear();
    writeln("1. Each player must secretly place their ships on a grid of ten columns by ten rows.");
    writeln("2. Each player has a second grid to track enemy attacks.");
    writeln("3. You attack by choosing coordinates (row and column).");
    writeln("4. First to destroy all enemy ships wins.");

    write("\nPress any key to return to menu >> :_ ");
    char c;
    readf(" %c", &c);
    gameState = GameState.MENU;
}

void gamePlay(ref GameState gameState) {
    clear();
    char[5][5] playerMap = ' ';
    char[5][5] enemyMap = ' ';
    char[5][5] territory = ' ';

    initShipPos(playerMap);
    initEnemyShipPos(enemyMap);

    int player_ships_destroyed = 0;
    int enemy_ships_destroyed = 0;
    bool gameWon = false;

    while (gameState != GameState.EXIT) {
        writeln("Your MAP, Captain:  ");
        display(playerMap);
        writeln("\nEnemy is hiding somewhere:  ");
        display(territory);

        writeln("Let's scout the area and attack (", player_ships_destroyed, " of ", NUM_SHIPS, " ships destroyed)");

        char x, y;
        write("X coord to attack (e to exit):>>_ ");
        readf(" %c", &x);
        if (x == 'e') {
            gameState = GameState.EXIT;
            break;
        }

        write("Y coord to attack (e to exit):>>_ ");
        readf(" %c", &y);
        if (y == 'e') {
            gameState = GameState.EXIT;
            break;
        }

        int ix = to!int(x - '0');
        int iy = to!int(y - '0');
        clear();

        if (ix < 0 || ix >= territory.length || iy < 0 || iy >= territory.length) continue;
        if (territory[ix][iy] != ' ') continue;

        if (enemyMap[ix][iy] == '1') {
            territory[ix][iy] = enemyMap[ix][iy] = 'x';
            player_ships_destroyed++;
        } else {
            territory[ix][iy] = enemyMap[ix][iy] = 'o';
        }

        if (player_ships_destroyed >= NUM_SHIPS) {
            gameState = GameState.EXIT;
            gameWon = true;
            break;
        }

        enemyAttack(playerMap, enemy_ships_destroyed);

        if (enemy_ships_destroyed >= NUM_SHIPS) {
            gameState = GameState.EXIT;
            gameWon = false;
            break;
        }
    }

    clear();
    if (gameWon) {
        writeln("YOU WON!");
    } else {
        writeln("Your Map, Captain:");
        display(playerMap);
        writeln("\nYOU LOST");
    }
}

void initShipPos(ref char[5][5] array) {
    int i = 0;
    while (i < NUM_SHIPS) {
        display(array);
        writeln("Enter your ship's position (", i, " of ", NUM_SHIPS, " ships):");

        char x, y;
        write("X coord: >>_ ");
        readf(" %c", &x);
        write("Y coord: >>_ ");
        readf(" %c", &y);

        int ix = to!int(x - '0');
        int iy = to!int(y - '0');

        clear();
        if (ix < 0 || ix >= array.length || iy < 0 || iy >= array.length) {
            writeln("\nERROR! INVALID COORDINATES. TRY AGAIN.");
            continue;
        }
        if (array[ix][iy] != ' ') {
            writeln("\nERROR! SHIP ALREADY EXISTS AT (", ix, ", ", iy, ")");
            continue;
        }
        array[ix][iy] = '1';
        i++;
    }
}

void initEnemyShipPos(ref char[5][5] array) {
    int i = 0;
    while (i < NUM_SHIPS) {
        int x = cast(int) uniform(0, array.length);
        int y = cast(int) uniform(0, array.length);

        if (array[x][y] != ' ') continue;
        array[x][y] = '1';
        i++;
    }
}

void enemyAttack(ref char[5][5] array, ref int ships_destroyed) {
    while (true) {
        int x = cast(int) uniform(0, array.length);
        int y = cast(int) uniform(0, array.length);

        if (array[x][y] == 'x' || array[x][y] == 'o') continue;

        if (array[x][y] == '1') {
            array[x][y] = 'x';
            ships_destroyed++;
        } else {
            array[x][y] = 'o';
        }
        break;
    }
}

void display(char[5][5] array) {
    write("   ");
    foreach (i; 0 .. array.length)
        write("   ", i);
    writeln();
    writeln("   _______________________________________");
    foreach (i; 0 .. array.length) {
        write(" ", i, " ");
        foreach (j; 0 .. array[i].length)
            write(" |  ", array[i][j]);
        writeln(" |");
        writeln("   _______________________________________");
    }
    writeln();
}
