module origen_061658 (
    input wire clk,
    input wire rst,
    input wire ShipGRB,
    input wire ShipClr,
    input wire bdone,
    output reg Done,
    output reg allDone,
    output reg nextLED,
    output reg changeColor,
    output reg lost,
    output reg loadColor,
    output reg loadClr,
    output reg ClrCounter,
    output reg StartCoding,
    output reg ShiftPattern,
    output reg IncCounter,
    output reg qmode
);

    // Parameters
    parameter SSHIPRET = 1'b0;
    parameter SSHIPGRB = 1'b1;
    parameter COMPAREVAL = 239; // Maximum bits per LED

    // Registers
    reg state;
    reg [14:0] rCount;
    reg [3:0] lCount;
    reg [22:0] dCount;
    reg [7:0] Count; // Added Count register

    // State machine
    [MASKED]

endmodule