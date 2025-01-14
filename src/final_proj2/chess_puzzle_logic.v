module chess_puzzle_logic(
    input clk,                         // System clock
    input [3:0] user_digit1,           // First digit of user input
    input [3:0] user_digit2,           // Second digit of user input
    input verify,                      // Signal to verify the solution
    output reg [4:0] display_digit0,   // Output for first display digit
    output reg [4:0] display_digit1,   // Output for second display digit
    output reg [4:0] display_digit2,   // Output for third display digit
    output reg [4:0] display_digit3,   // Output for fourth display digit
    output reg [4:0] leds,             // LEDs indicating correct answers
    output reg correct                 // Flag indicating if the answer is correct
);

    reg [7:0] puzzle_answers[5:0];    // Array to hold answers for each puzzle
    reg [23:0] puzzle_views[5:0];     // Array to hold views for each puzzle (24-bit for 6 characters)
    reg [2:0] current_puzzle;         // Current puzzle number
    reg verify_prev = 1;              // Previous state of the verify signal
    reg state = 0; // 0 for puzzle view, 1 for answer feedback

    initial begin
        // Initialize puzzles with their answers and views
        // Puzzle 1: Knight Fork
        puzzle_answers[1] = 8'b01001010; // Answer: Ne4 reversed
        puzzle_views[1] = 16'b0110101100101001; // View: b3 d7

        // Puzzle 2: Knight Fork
        puzzle_answers[2] = 8'b00111001; // Answer: 4b Nb4 reversed
        puzzle_views[2] = 16'b0101101000011000; // View: 6C 2A (A2 C6 reversed)

        // Puzzle 3: Bishop Fork
        puzzle_answers[3] = 8'b00111011; // Answer: 4d (Bd4 reversed)
        puzzle_views[3] = 16'b0010101001011101; // View: 3C 6F (F6 C3 reversed)

        // Puzzle 4: Bishop Skewer
        puzzle_answers[4] = 8'b00001100; // Answer: 1e (Be1 reversed)
        puzzle_views[4] = 16'b0100100000101010; // View: 5A 3C (C3 A5 reversed)

        // Puzzle 5: Queen Checkmate
        puzzle_answers[5] = 8'b01101001; // Answer: 7b (Qb7 reversed)
        puzzle_views[5] = 16'b0010110101111001; // View: 3F 8b (b8 F3 reversed)

        // Puzzle 6: King Draw
        puzzle_answers[0] = 8'b00101100; // Answer: 3e (Ke3 reversed)
        puzzle_views[0] = 16'b0101110001001100; // View: 6E 5E (E5 E6 reversed)

        current_puzzle = 0;
        leds = 6'b000000; // Initialize all LEDs to off
    end

always @(posedge clk) begin
    verify_prev <= verify;

    // When verify button is pressed
    if (verify_prev && ~verify) begin
        // Check if user input matches the puzzle answer
        if (state == 0) begin
            if (user_digit1 == puzzle_answers[current_puzzle][3:0] && 
                user_digit2 == puzzle_answers[current_puzzle][7:4]) begin
                correct <= 1;
                leds[current_puzzle == 0 ? 5 : current_puzzle - 1] <= 1; // Update LED for the current puzzle
            end else begin
                correct <= 0;
                leds[current_puzzle == 0 ? 5 : current_puzzle - 1] <= 0; // Update LED for the current puzzle
            end
            state <= 1; // Change state to answer feedback
        end else begin
            // Reset state and advance to the next puzzle
            state <= 0;
            current_puzzle <= (current_puzzle == 5) ? 0 : current_puzzle + 1;
            if (current_puzzle == 0) leds <= 6'b000000; // Reset LEDs when cycling back to the first puzzle
        end
    end

        // Display logic based on the current state
        if (state == 0) begin
            // Display the current puzzle view
            display_digit0 <= puzzle_views[current_puzzle][3:0];    
            display_digit1 <= puzzle_views[current_puzzle][7:4];    
            display_digit2 <= puzzle_views[current_puzzle][11:8];   
            display_digit3 <= puzzle_views[current_puzzle][15:12];  
        end else begin
// Display feedback based on correctness
if (correct) begin
    display_digit0 <= 7'b10010; //pass
    display_digit1 <= 7'b01000; 
    display_digit2 <= 7'b00100; 
    display_digit3 <= 7'b00100; 
end else begin
    display_digit0 <= 7'b01101; //fail
    display_digit1 <= 7'b01000; 
    display_digit2 <= 7'b10000; 
    display_digit3 <= 7'b10001; 
end


        end
    end
endmodule
