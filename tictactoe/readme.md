    ![Alternative text for the image](tictactoe/Screenshot from 2025-05-27 21-12-17.png)
**Tic-Tac-Toe in D**
This is a simple console-based Tic-Tac-Toe game written in the D programming language. The game allows two players to take turns entering their moves, and checks for win conditions after every turn.

🕹️ How to Play
The game uses a 3×3 grid.

Player X and Player O take turns.

Players enter the x (column) and y (row) coordinates (0, 1, or 2) to make a move.

If a cell is already occupied or the input is invalid, the player is prompted again.

The game ends when one player wins by lining up three of their symbols or the board is full (note: draw detection is not implemented yet).

🚀 Getting Started
Requirements
D compiler (e.g., dmd)

Running the Game
bash
Copy
Edit
dmd tictactoe.d -of=tictactoe
./tictactoe
Menu
When you run the program, you'll be presented with a simple menu:

scss
Copy
Edit
Hello!
(1) Play
(2) Exit
:_ 
Enter 1 or play to start.

Enter 2 or anything else to exit.

📋 Controls
You are prompted to enter x (column) and y (row) coordinates one at a time:

makefile
Copy
Edit
x:_ 1
y:_ 2
This places your symbol at position (1, 2) on the board.

📦 File Structure
tictactoe.d — Main source code file

🛠️ Features
Interactive console input

Turn-based play between two users

Win condition checks for:

Rows

Columns

Diagonals

Input validation (non-digit and out-of-range handling)

Prevents overwriting occupied cells

❌ Missing Features
Draw condition detection

AI for single-player mode

Input sanitization beyond basic digit checks
