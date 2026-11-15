module rtlpp_03876 (
    input [0:0] datain,
    output [0:0] dataout,
    output [0:0] dataout_b
);

    wire [0:0] wire_obuf_ba_oe;
    wire [0:0] wire_obufa_oe;
    wire [0:0] wire_pseudo_diffa_o;
    wire [0:0] wire_pseudo_diffa_obar;
    wire [0:0] wire_pseudo_diffa_oebout;
    wire [0:0] wire_pseudo_diffa_oein;
    wire [0:0] wire_pseudo_diffa_oeout;
    wire [0:0] oe_w;
    
    // Cyclone V pseudo differential output logic
    assign wire_pseudo_diffa_o = datain;
    assign wire_pseudo_diffa_obar = ~datain;
    assign wire_pseudo_diffa_oebout = 1'b0;
    assign wire_pseudo_diffa_oeout = oe_w;
    assign wire_pseudo_diffa_oein = ~oe_w;

    // OBUF block logic
    assign wire_obuf_ba_oe = ~wire_pseudo_diffa_oebout;
    assign wire_obufa_oe = ~wire_pseudo_diffa_oeout;

    assign dataout = wire_pseudo_diffa_o;
    assign dataout_b = wire_pseudo_diffa_obar;

    assign oe_w = 1'b1;

endmodule