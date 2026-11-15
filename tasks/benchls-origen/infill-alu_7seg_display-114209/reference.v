module origen_114209 (
    input wire clk_2,
    input wire [7:0] SWI,
    output logic [7:0] LED,
    output logic [7:0] SEG,
    output logic [7:0] LCD_RS,
    output logic [7:0] LCD_RW,
    output logic [7:0] LCD_E,
    output logic [7:0] LCD_DB
);

    logic [2:0] a, b;
    logic [3:0] result;
    logic sign;
    logic [2:0] carry;

    always_comb begin
        // ALU: Signed 3-bit addition/subtraction
        a = SWI[2:0];
        b = SWI[6:4];
        {sign, result} = {1'b0, (SWI[3] ? -$signed({1'b0, a}) : $signed({1'b0, a}))} + 
                         {1'b0, (SWI[7] ? -$signed({1'b0, b}) : $signed({1'b0, b}))};

        // Carry chain
        carry[0] = SWI[0] & SWI[4];
        carry[1] = (SWI[1] & SWI[5]) | (carry[0] & (SWI[1] | SWI[5]));
        carry[2] = (SWI[2] & SWI[6]) | (carry[1] & (SWI[2] | SWI[6]));

        // Output assignments
        LED[3:0] = result;
        LED[7:4] = 4'b0000;
        LED[7] = carry[2];
        SEG[7] = sign;

        // Seven-segment display decoding
        case (result[2:0])
            3'b000: SEG[6:0] = 7'b1000000; // 0
            3'b001: SEG[6:0] = 7'b1111001; // 1
            3'b010: SEG[6:0] = 7'b0100100; // 2
            3'b011: SEG[6:0] = 7'b0110000; // 3
            3'b100: SEG[6:0] = 7'b0011001; // 4
            3'b101: SEG[6:0] = 7'b0010010; // 5
            3'b110: SEG[6:0] = 7'b0000010; // 6
            3'b111: SEG[6:0] = 7'b1111000; // 7
            default: SEG[6:0] = 7'b1111111; // All off
        endcase

        // LCD debug outputs (simulated values)
        LCD_RS = 8'hAA;
        LCD_RW = 8'h55;
        LCD_E = 8'hCC;
        LCD_DB = {4'b0000, result};
    end

endmodule