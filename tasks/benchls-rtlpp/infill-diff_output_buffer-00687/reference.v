module rtlpp_00687
    (
    input   [0:0]  datain,
    output  [0:0]  dataout,
    output  [0:0]  dataout_b
    );

    wire  [0:0]   wire_obuf_ba_o;
    wire  [0:0]   wire_obuf_ba_oe;
    wire  [0:0]   wire_obufa_o;
    wire  [0:0]   wire_obufa_oe;
    wire  [0:0]   wire_pseudo_diffa_o;
    wire  [0:0]   wire_pseudo_diffa_obar;
    wire  [0:0]   wire_pseudo_diffa_oebout;
    wire  [0:0]   wire_pseudo_diffa_oein;
    wire  [0:0]   wire_pseudo_diffa_oeout;
    wire  [0:0]  oe_w;

    // Internal logic for wire_obuf_ba_o 
    assign wire_obuf_ba_o = wire_pseudo_diffa_obar;
    assign wire_obuf_ba_oe = ~wire_pseudo_diffa_oebout;

    // Internal logic for wire_obufa_o 
    assign wire_obufa_o = wire_pseudo_diffa_o;
    assign wire_obufa_oe = ~wire_pseudo_diffa_oeout;

    // Internal logic for pseudo_diffa_0 
    assign wire_pseudo_diffa_o = datain;
    assign wire_pseudo_diffa_obar = ~datain;
    assign wire_pseudo_diffa_oebout = 1'b0;
    assign wire_pseudo_diffa_oein = ~oe_w;
    assign wire_pseudo_diffa_oeout = ~oe_w;

    assign oe_w = 1'b1;
    assign dataout = wire_obufa_o;
    assign dataout_b = wire_obuf_ba_o;

endmodule