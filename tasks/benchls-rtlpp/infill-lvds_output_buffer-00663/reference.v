module rtlpp_00663
    (
    input      [0:0] datain,
    output     [0:0] dataout,
    output     [0:0] dataout_b
    );

    wire [0:0] wire_obuf_ba_oe;
    wire [0:0] wire_obufa_oe;
    wire [0:0] wire_pseudo_diffa_o;
    wire [0:0] wire_pseudo_diffa_obar;
    wire [0:0] wire_pseudo_diffa_oebout;
    wire [0:0] wire_pseudo_diffa_oein;
    wire [0:0] wire_pseudo_diffa_oeout;
    wire [0:0] oe_w;

    // Logic embedded from cyclonev_io_obuf
    wire [0:0] wire_obuf_ba_o;
    wire [0:0] wire_obufa_o;
    
    assign wire_obuf_ba_o = wire_pseudo_diffa_obar;
    assign wire_obufa_o = wire_pseudo_diffa_o;
    assign wire_obuf_ba_oe = ~wire_pseudo_diffa_oebout[0];
    assign wire_obufa_oe = ~wire_pseudo_diffa_oeout[0];
    
    // Logic embedded from cyclonev_pseudo_diff_out
    assign wire_pseudo_diffa_o = datain;
    assign wire_pseudo_diffa_obar = ~datain;
    assign wire_pseudo_diffa_oebout = 1'b1;
    assign wire_pseudo_diffa_oeout = 1'b1;
    assign wire_pseudo_diffa_oein = ~oe_w[0];
    
    assign dataout = wire_obufa_o;
    assign dataout_b = wire_obuf_ba_o;
    assign oe_w = 1'b1;

endmodule