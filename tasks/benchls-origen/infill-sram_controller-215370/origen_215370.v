module origen_215370(
    input clk,
    input rst,
    input read_ce,
    input write_ce,
    input [31:0] write_data,
    input [19:0] addr,
    input [31:0] rom_rdata,
    output reg fin,
    output reg [31:0] rom_wdata,
    output reg [19:0] rom_addr,
    output reg ce,
    output reg we,
    output reg oe,
    output reg [31:0] read_data
);

    reg [2:0] state;
    localparam [2:0]
        prepare = 3'b000,
        r0 = 3'b001, r1 = 3'b010, r2 = 3'b011, r3 = 3'b100, r4 = 3'b101,
        w0 = 3'b001, w1 = 3'b010, w2 = 3'b011, w3 = 3'b100, w4 = 3'b101;

    [MASKED]

endmodule