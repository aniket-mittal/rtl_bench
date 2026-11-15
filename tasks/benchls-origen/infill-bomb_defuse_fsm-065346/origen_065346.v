module origen_065346 (
    input wire clock_65mhz,
    input wire reset,
    input wire enable,
    input wire [3:0] user_in,
    output reg strike,
    output reg module_defused,
    output reg [2:0] user_out
);

    // State definitions
    localparam [1:0] PINONE = 2'b00, PINTHREE = 2'b01, PINFIVE = 2'b10;
    localparam [2:0] START = 3'b000, FIRST = 3'b001, SECOND = 3'b010, THIRD = 3'b011,
                     FOURTH = 3'b100, FIFTH = 3'b101, SIXTH = 3'b110, DONE = 3'b111;

    reg [1:0] states_out;
    reg [2:0] keys_states;
    reg [11:0] keys;

    [MASKED]

endmodule