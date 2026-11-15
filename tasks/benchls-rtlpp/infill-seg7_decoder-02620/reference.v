module rtlpp_02620(BCD, 
              SSEG_A);

    input [3:0] BCD;
    output SSEG_A;
   
    wire XLXN_2;
    wire XLXN_3;
    wire XLXN_4;
    wire XLXN_6;
    wire XLXN_7;
    wire XLXN_8;
   
    // AND gates logic
    assign XLXN_6 = ~BCD[0] & BCD[2];
    assign XLXN_4 = BCD[1] & BCD[2];
    assign XLXN_7 = ~BCD[1] & BCD[2] & BCD[3];
    assign XLXN_2 = ~BCD[3] & BCD[1];
    assign XLXN_3 = ~BCD[3] & BCD[2] & ~BCD[0];
    assign XLXN_8 = ~BCD[0] & BCD[3];
    
    // OR6_HXILINX_SSEG_A logic equivalent
    assign SSEG_A = XLXN_8 | XLXN_7 | XLXN_4 | XLXN_3 | XLXN_2 | XLXN_6;

endmodule