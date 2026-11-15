module origen_052480 (
    input wire clk,
    input wire rst_n,
    input wire [4:0] RSaddr_i,
    input wire [4:0] RTaddr_i,
    input wire [4:0] RDaddr_i,
    input wire [31:0] RDdata_i,
    input wire [63:0] RDdata_D_i,
    input wire Fcond_i,
    input wire [1:0] RegWrite_i,
    input wire FPcondWrite,
    output wire [31:0] RSdata_o,
    output wire [31:0] RTdata_o,
    output wire [63:0] RSdata_D_o,
    output wire [63:0] RTdata_D_o,
    output wire Fcond_o
);

    reg [31:0] register [0:31];
    reg Fcond;

    // Read operations
    assign RSdata_o = register[RSaddr_i];
    assign RTdata_o = register[RTaddr_i];
    assign RSdata_D_o = {register[RSaddr_i+1], register[RSaddr_i]};
    assign RTdata_D_o = {register[RTaddr_i+1], register[RTaddr_i]};
    assign Fcond_o = Fcond;

    integer i;
    [MASKED]

endmodule