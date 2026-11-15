module rtlpp_00895(Inp0, 
                    Inp1, 
                    Sel, 
                    Output);

    input [8:0] Inp0;
    input [8:0] Inp1;
    input Sel;
    output [9:0] Output;
   
    wire XLXN_1;
   
    assign XLXN_1 = 1'b0;

    assign Output[1] = Sel ? Inp0[1] : Inp1[0];
    assign Output[0] = Sel ? Inp0[0] : XLXN_1;
    assign Output[2] = Sel ? Inp0[2] : Inp1[1];
    assign Output[3] = Sel ? Inp0[3] : Inp1[2];
    assign Output[4] = Sel ? Inp0[4] : Inp1[3];
    assign Output[5] = Sel ? Inp0[5] : Inp1[4];
    assign Output[6] = Sel ? Inp0[6] : Inp1[5];
    assign Output[7] = Sel ? Inp0[7] : Inp1[6];
    assign Output[8] = Sel ? Inp0[8] : Inp1[7];
    assign Output[9] = Inp1[8];

endmodule