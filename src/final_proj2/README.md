# Verilog Chess Puzzle Game for DE-10 Lite
# By Beto Rico December 2023

## Features
- Interactive chess puzzles with visual feedback.
- Uses 7-segment displays to show puzzle information and user inputs.
- Supports input via switches and buttons on the DE10-Lite board.

## Usage Instructions
1. **Input Coordinates**: Refer to the `Puzzle Information` table and use switches 0-3 to set the rank/file and switch 9 to toggle between the first and second digits of the answer.
2. **Verify Answer**: Press `KEY[1]` to verify your answer.
   - Correct answers will show `PASS` and light up the nth LED.
   - Incorrect answers will show `FAIL` and not light up the nth LED.
3. **Advance Puzzle**: After verifying the current puzzle, press `KEY[1]` again to move to the next puzzle.
4. **Start Over**: The game loops through all six puzzles in order.




## Game Information

The user always controls the white pieces and inputs the coordinates for the best move for their given piece in each puzzle. The game features six chess puzzles, each requiring the user to identify the optimal move based on the board setup.

---

## Puzzle Information

| Puzzle Type         | Piece 1          | Piece 2          | Player Piece   |
|---------------------|------------------|------------------|----------------|
| **Knight Fork**     | Black King b3    | Black Rook d7    | Knight e4      |
| **Knight Fork**     | Black King a2    | Black Rook c6    | Knight c2      |
| **Bishop Fork**     | Black King f6    | Black Rook c3    | Bishop b6      |
| **Bishop Skewer**   | Black King c3    | Black Queen a5   | Bishop h4      |
| **Queen Checkmate** | Black King b8    | White Bishop f3  | Queen g7       |
| **King Draw**       | Black King e5    | Black Pawn e6    | King d2        |

---

## Answers List

All answers for the puzzles:
- **C5**
- **b4**
- **d4**
- **E1**
- **b7**
- **E3**

---

## Video Demonstration

A video demonstration of the program is available [here](https://youtu.be/ZWpLmUFcZTgs).

## Technical Details
- **Board**: DE10-Lite FPGA
- **Language**: Verilog HDL
- **Modules**:
  - `input_handling`: Manages user input from switches and buttons.
  - `seven_seg_display_driver`: Drives the 7-segment displays based on binary inputs.
  - `chess_puzzle_logic`: Contains puzzle logic and solution validation.
  - **Pin Assignments**: Configured for DE10-Lite hardware directly in the `DE10_LITE_Golden_Top.v` file, eliminating the need for a separate pin planner configuration.


## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

