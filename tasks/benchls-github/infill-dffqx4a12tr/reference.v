module _MAGMA_CELL_FF_ (DATA, CLOCK, CLEAR, PRESET, SLAVE_CLOCK, OUT);

   input DATA;
   input CLOCK;
   input CLEAR;
   input PRESET;
   input SLAVE_CLOCK;
   output OUT;
   reg    OUT;

   // synopsys one_hot "PRESET, CLEAR"
   always @(posedge CLOCK or posedge PRESET or posedge CLEAR)
   if (CLEAR)
     OUT <= 1'b0;
   else
     if (PRESET)
       OUT <= 1'b1;
     else
       OUT <= DATA;
endmodule

module DFFQX4A12TR (CK, D, Q);
  input CK, D;
  output Q;
  supply0 N6;
  _MAGMA_CELL_FF_ C1 (.DATA(D), .CLOCK(CK), .CLEAR(N6), .PRESET(N6), .SLAVE_CLOCK(N6), .OUT(Q));
endmodule