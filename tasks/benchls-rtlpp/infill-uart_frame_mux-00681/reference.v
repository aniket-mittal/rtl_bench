module rtlpp_00681 (
    input [1:0] selection,
    input start_bit,
    input data_bit,
    input parity_bit,
    input stop_bit,
    output data_out
);
    
    wire gnd;
    wire vcc;

    assign gnd = 1'b0;
    assign vcc = 1'b1;

    wire \data_out_combout0 ;
    wire \data_out_combout1 ;

    // LUT logic for data_out_combout0
    assign \data_out_combout0  = 
            (start_bit & ~selection[1] & ~selection[0] & ~data_bit) |
            (start_bit & ~selection[1] & selection[0] & data_bit) |
            (~start_bit & selection[1] & selection[0] & data_bit) |
            (~start_bit & selection[1] & ~selection[0] & data_bit);

    // LUT logic for data_out_combout1
    assign \data_out_combout1  = 
            (~selection[1] & ~parity_bit & ~stop_bit & data_out_combout0) |
            (~selection[1] & parity_bit & ~stop_bit & data_out_combout0) |
            (selection[1] & parity_bit & ~stop_bit & data_out_combout0);

    assign data_out = \data_out_combout1 ;

endmodule