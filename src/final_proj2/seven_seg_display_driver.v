module seven_seg_display_driver(
    input [4:0] binary_input, // 4-bit binary input
    output reg [6:0] display  // 7-bit output for the seven segments (a-g)
);

    always @(*) begin
        case(binary_input)
            5'b00000: display = 7'b1111001; // 1
            5'b00001: display = 7'b0100100; // 2
            5'b00010: display = 7'b0110000; // 3
            5'b00011: display = 7'b0011001; // 4
            5'b00100: display = 7'b0010010; // 5
            5'b00101: display = 7'b0000010; // 6
            5'b00110: display = 7'b1111000; // 7
            5'b00111: display = 7'b0000000; // 8
            5'b01000: display = 7'b0001000; // A
            5'b01001: display = 7'b0000011; // b
            5'b01010: display = 7'b1000110; // C
            5'b01011: display = 7'b0100001; // d
            5'b01100: display = 7'b0000110; // E
            5'b01101: display = 7'b0001110; // F
            5'b01110: display = 7'b0010000; // g
            5'b01111: display = 7'b0001001; // H
				5'b10000: display = 7'b1001111; // I
            5'b10001: display = 7'b1000111; // L
            5'b10010: display = 7'b0001100; // P
            default: display = 7'b1111111; // Off
				/*
				I:1001111
				L:1000111
				P:0001100
				
				
				*/
        endcase
    end
endmodule
