module origen_173226(
    input [7:0] DATA,
    output reg msg_req,
    input sending,
    input dready,
    output reg dacpt,
    input clock,
    input reset
);

    reg [7:0] nextdata [7:0];
    reg [2:0] addr = 0;
    reg [31:0] delay;

    parameter RS1 = 2'b00, RS2 = 2'b01, RS3 = 2'b10, other = 2'b11;
    reg [1:0] state = other;

    [MASKED]

endmodule