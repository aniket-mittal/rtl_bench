module rtlpp_03947
    ( 
    datain,
    dataout,
    dataout_b
    );
    input   [0:0]  datain;
    output  [0:0]  dataout;
    output  [0:0]  dataout_b;

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

    // Embedding cyclonev_io_obuf logic for obuf_ba_0 instance
    assign wire_obuf_ba_o = wire_pseudo_diffa_obar;
    assign wire_obuf_ba_oe = (~ wire_pseudo_diffa_oebout[0]);

    // Embedding cyclonev_io_obuf logic for obufa_0 instance
    assign wire_obufa_o = wire_pseudo_diffa_o;
    assign wire_obufa_oe = (~ wire_pseudo_diffa_oeout[0]);

    // Embedding cyclonev_pseudo_diff_out logic for pseudo_diffa_0 instance
    assign wire_pseudo_diffa_o = datain;
    assign wire_pseudo_diffa_obar = ~datain;
    assign wire_pseudo_diffa_oebout = {1'b0};
    assign wire_pseudo_diffa_oeout = {1'b0};
    assign wire_pseudo_diffa_oein = {(~ oe_w[0])};
    
    assign dataout = wire_obufa_o;
    assign dataout_b = wire_obuf_ba_o;
    assign oe_w = 1'b1;
endmodule