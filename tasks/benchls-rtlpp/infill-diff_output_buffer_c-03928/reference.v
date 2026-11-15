module rtlpp_03928
(
    input  [0:0] datain,
    output [0:0] dataout,
    output [0:0] dataout_b
);

    wire [0:0] wire_obuf_ba_o;
    wire [0:0] wire_obuf_ba_oe;
    wire [0:0] wire_obufa_o;
    wire [0:0] wire_obufa_oe;
    wire [0:0] wire_pseudo_diffa_o;
    wire [0:0] wire_pseudo_diffa_obar;
    wire [0:0] wire_pseudo_diffa_oebout;
    wire [0:0] wire_pseudo_diffa_oein;
    wire [0:0] wire_pseudo_diffa_oeout;
    wire [0:0] oe_w;

    assign wire_obuf_ba_oe = ~wire_pseudo_diffa_oebout[0];
    assign wire_obufa_oe = ~wire_pseudo_diffa_oeout[0];
    assign wire_pseudo_diffa_oein = ~oe_w[0];
    assign dataout = wire_obufa_o;
    assign dataout_b = wire_obuf_ba_o;
    assign oe_w = 1'b1;

    // Simulated logic for cyclonev_io_obuf (mocked for synthesis purposes)
    assign wire_obuf_ba_o[0] = wire_pseudo_diffa_obar[0] & wire_obuf_ba_oe[0];
    assign wire_obufa_o[0] = wire_pseudo_diffa_o[0] & wire_obufa_oe[0];

    // Simulated logic for cyclonev_pseudo_diff_out (mocked for synthesis purposes)
    assign wire_pseudo_diffa_o[0] = datain[0];
    assign wire_pseudo_diffa_obar[0] = ~datain[0];
    assign wire_pseudo_diffa_oebout[0] = datain[0];
    assign wire_pseudo_diffa_oeout[0] = datain[0];

endmodule