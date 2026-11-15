`define LOAD 5'b00010
`define R0 3'b000
`define R1 3'b001
`define R2 3'b010
`define R3 3'b011
`define R4 3'b100
`define R5 3'b101
`define R6 3'b110
`define R7 3'b111

module origen_006663 (
    input wire clock,
    input wire reset,
    input wire state,
    input wire cf,
    input wire hit,
    input wire [15:0] mem_ir,
    input wire [15:0] d_datain,
    input wire [15:0] reg_C,
    input wire [15:0] cachedata,
    output reg [15:0] wb_ir,
    output reg [15:0] reg_C1,
    output reg [127:0] all
);

    // State parameters
    localparam IDLE = 1'b0;
    localparam EXEC = 1'b1;

    [MASKED]

endmodule