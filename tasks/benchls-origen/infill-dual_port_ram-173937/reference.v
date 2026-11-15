`timescale 1ns / 1ps

module origen_173937 #(
    parameter SIZE = 10,
    parameter WIDTH = 32,
    parameter ALTOR32_CLEAR_RAM = 1
)(
    input  wire                  aclk_i,
    input  wire                  bclk_i,
    output wire [WIDTH-1:0]      adat_o,
    output wire [WIDTH-1:0]      bdat_o,
    input  wire [WIDTH-1:0]      adat_i,
    input  wire [WIDTH-1:0]      bdat_i,
    input  wire [SIZE-1:0]       aadr_i,
    input  wire [SIZE-1:0]       badr_i,
    input  wire                  awr_i,
    input  wire                  bwr_i
);

    localparam RAM_DEPTH = (2 << (SIZE-1)) - 1;

    reg [WIDTH-1:0] ram [0:RAM_DEPTH-1];
    reg [SIZE-1:0] rd_addr_a_q;
    reg [SIZE-1:0] rd_addr_b_q;

    // Initialize the RAM with zeros (optional)
    `ifdef ALTOR32_CLEAR_RAM
    integer i;
    initial begin
        for (i = 0; i < RAM_DEPTH; i = i + 1) begin
            ram[i] <= {WIDTH{1'b0}};
        end
    end
    `endif

    // Port A: Write operation
    always @(posedge aclk_i) begin
        if (awr_i) begin
            ram[aadr_i] <= adat_i;
        end
        rd_addr_a_q <= aadr_i;
    end

    // Port A: Read operation
    assign adat_o = ram[rd_addr_a_q];

    // Port B: Write operation
    always @(posedge bclk_i) begin
        if (bwr_i) begin
            ram[badr_i] <= bdat_i;
        end
        rd_addr_b_q <= badr_i;
    end

    // Port B: Read operation
    assign bdat_o = ram[rd_addr_b_q];

endmodule