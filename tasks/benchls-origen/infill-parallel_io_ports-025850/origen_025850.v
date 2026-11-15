module origen_025850 (
    input wire clk,
    input wire reset_n,
    output reg [7:0] data_out,
    input wire [7:0] data_in,
    input wire cs_n,
    input wire rd_n,
    input wire wr_n,
    input wire [1:0] addr,
    output reg [7:0] P1_out,
    output reg [7:0] P2_out,
    input wire [7:0] P1_in,
    input wire [7:0] P2_in,
    output wire P1_oen,
    output wire P2_oen
);

    localparam MODE_RD = 1'b0;
    localparam MODE_WR = 1'b1;

    reg [7:0] cfgreg;
    reg [7:0] out_1, out_2;
    reg [7:0] in_1, in_2;

    wire read_sel, write_sel;
    assign read_sel = ~cs_n & ~rd_n;
    assign write_sel = ~cs_n & ~wr_n;

    assign P1_oen = cfgreg[0] == MODE_WR;
    assign P2_oen = cfgreg[1] == MODE_WR;

    [MASKED]

    always @(*) begin
        P1_out = out_1;
        P2_out = out_2;
    end

endmodule