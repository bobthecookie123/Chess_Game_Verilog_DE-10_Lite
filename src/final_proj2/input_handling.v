module input_handling(
    input clk,                   // System clock
    input [9:0] switches,        // Switches for user input
    input enter_button,          // Active-low button to enter/verify the answer
    output reg [3:0] digit1,     // First digit of the answer
    output reg [3:0] digit2,     // Second digit of the answer
    output reg verify            // Signal to trigger answer verification
);

    reg toggle_state = 0;        // Toggle state for switching between digit1 and digit2
    reg enter_button_prev = 1;   // Previous state of the enter button (initialized to high)

    // Toggle input digit selection with the 10th switch
    always @(posedge clk) begin
        toggle_state <= switches[9];

        // Capture the input based on the toggle state
        if (toggle_state) begin
            digit2 <= switches[3:0]; // Update digit2 when toggle_state is high
        end else begin
            digit1 <= switches[3:0]; // Update digit1 when toggle_state is low
        end

        // Detect falling edge of the enter button (high-to-low transition)
        if (enter_button_prev && ~enter_button) begin
            verify <= 1; // Set verify signal on button press
        end else begin
            verify <= 0; // Reset verify signal
        end
        enter_button_prev <= enter_button; // Update the previous state
    end
endmodule
