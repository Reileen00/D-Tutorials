# 🎮 Tic-Tac-Toe in D

A simple console-based Tic-Tac-Toe game written in the **D programming language**, featuring two-player turn-based gameplay, win detection, and basic input validation.

---

## 🖼️ Screenshot

Below is a sample gameplay screenshot:

![Tic Tac Toe Screenshot](Screenshot%20from%202025-05-27%2021-12-17.png)


## 📑 Table of Contents

- [How to Play](#how-to-play)
- [Requirements](#requirements)
- [Build and Run](#build-and-run)
- [Game Menu](#game-menu)
- [Controls](#controls)
- [Source Code](#source-code)
- [Features](#features)
- [Limitations](#limitations)
- [License](#license)

---

## 🕹️ How to Play

- The game is played on a 3x3 grid.
- Two players (X and O) take turns marking spaces in the grid.
- The first player to get 3 of their marks in a row (horizontally, vertically, or diagonally) wins.
- If a move is invalid (non-digit, out-of-range, or the cell is already occupied), the player is prompted again.
- *Note: Draw detection is not implemented.*

---

## 🛠 Requirements

- D Language compiler (`dmd`)  
  [Install D](https://dlang.org/download.html)

---

## 🚀 Build and Run

```bash
dmd tictactoe.d -of=tictactoe
./tictactoe
```
## 📋 Game Menu

When the program starts, you'll see:
```
Hello!
(1) Play
(2) Exit
:_

- Type `1`, `play`, or `p` to start the game.
- Type `2` or anything else to exit.

```

## 🎮 Controls

Players are prompted to input their move coordinates:

```
x:_ 1
y:_ 2
```
This places the current player's symbol at **column 1, row 2** of the board.


## 📦 Source Code

The full game is implemented in D. You can find the main logic in the file `newmain.d`.
