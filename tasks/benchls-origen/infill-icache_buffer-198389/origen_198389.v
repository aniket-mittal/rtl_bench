module origen_198389 (
    input  wire [31:0] tval2_i, tval1_i, data_bi, icconf_i,
    input  wire [12:0] addr_bi,
    input  wire        ins_i, we_bi, en_i, rst_i, clk_i,
    input  wire [1:0]  ictmr_i,
    output reg  [31:0] data_bo,
    output reg  [31:0] icov_o, icbne_o, icconf_o
);

    reg [31:0] icbuf [15:0];
    reg [4:0]  fst_idx_reg, idx_reg;
    reg [31:0] icconf_reg;
    reg        icbne_reg, icov_reg;

    [MASKED]

    assign icov_o = {31'b0, icov_reg};
    assign icbne_o = {31'b0, icbne_reg};
    assign icconf_o = icconf_reg;

endmodule