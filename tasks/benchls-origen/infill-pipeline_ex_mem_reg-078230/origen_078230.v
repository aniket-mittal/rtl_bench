module origen_078230 (
    input wire clockIn,
    input wire reset,
    input wire stall,
    input wire memStall,
    input wire haltIn,
    input wire regWriteIn,
    input wire mem2RegIn,
    input wire memWriteIn,
    input wire memReadIn,
    input wire [31:0] data1In,
    input wire [31:0] data2In,
    input wire [4:0] regIn,
    input wire [4:0] reg2In,
    output reg haltOut,
    output reg regWriteOut,
    output reg mem2RegOut,
    output reg memWriteOut,
    output reg memReadOut,
    output reg [31:0] data1Out,
    output reg [31:0] data2Out,
    output reg [4:0] regOut,
    output reg [4:0] reg2Out
);

    [MASKED]

endmodule