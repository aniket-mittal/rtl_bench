module autovcoder_018778 (lut4, in0, in1, in2, in3, in0b, in1b, in2b, in3b, cbit);

//the output signal
output lut4;

//the input signals
input in0, in1, in2, in3, in0b, in1b, in2b, in3b;
input [15:0] cbit;

reg lut4;
      
`ifdef TIMINGCHECK
  specify
    // delay parameters
    specparam
      tplh$cbit0$lut4= 1.0,
      tphl$cbit0$lut4= 1.0,
      tplh$cbit1$lut4= 1.0,
      tphl$cbit1$lut4= 1.0,
      tplh$cbit2$lut4= 1.0,
      tphl$cbit2$lut4= 1.0,
      tplh$cbit3$lut4= 1.0,
      tphl$cbit3$lut4= 1.0,
      tplh$cbit4$lut4= 1.0,
      tphl$cbit4$lut4= 1.0,
      tplh$cbit5$lut4= 1.0,
      tphl$cbit5$lut4= 1.0,
      tplh$cbit6$lut4= 1.0,
      tphl$cbit6$lut4= 1.0,
      tplh$cbit7$lut4= 1.0,
      tphl$cbit7$lut4= 1.0,
      tplh$cbit8$lut4= 1.0,
      tphl$cbit8$lut4= 1.0,
      tplh$cbit9$lut4= 1.0,
      tphl$cbit9$lut4= 1.0,
      tplh$cbit10$lut4= 1.0,
      tphl$cbit10$lut4= 1.0,
      tplh$cbit11$lut4= 1.0,
      tphl$cbit11$lut4= 1.0,
      tplh$cbit12$lut4= 1.0,
      tphl$cbit12$lut4= 1.0,
      tplh$cbit13$lut4= 1.0,
      tphl$cbit13$lut4= 1.0,
      tplh$cbit14$lut4= 1.0,
      tphl$cbit14$lut4= 1.0,
      tplh$cbit15$lut4= 1.0,
      tphl$cbit15$lut4= 1.0,
      tplh$in3$lut4= 1.0,
      tphl$in3$lut4= 1.0,
      tplh$in2$lut4= 1.0,
      tphl$in2$lut4= 1.0,
      tplh$in1$lut4= 1.0,
      tphl$in1$lut4= 1.0,
      tplh$in0$lut4= 1.0,
      tphl$in0$lut4= 1.0;
      tplh$in3b$lut4= 1.0,
      tphl$in3b$lut4= 1.0,
      tplh$in2b$lut4= 1.0,
      tphl$in2b$lut4= 1.0,
      tplh$in1b$lut4= 1.0,
      tphl$in1b$lut4= 1.0,
      tplh$in0b$lut4= 1.0,
      tphl$in0b$lut4= 1.0;

    // path delays
     (cbit[15] *> lut4) = (tplh$cbit15$lut4, tphl$cbit15$lut4);
     (cbit[14] *> lut4) = (tplh$cbit14$lut4, tphl$cbit14$lut4);
     (cbit[13] *> lut4) = (tplh$cbit13$lut4, tphl$cbit13$lut4);
     (cbit[12] *> lut4) = (tplh$cbit12$lut4, tphl$cbit12$lut4);
     (cbit[11] *> lut4) = (tplh$cbit11$lut4, tphl$cbit11$lut4);
     (cbit[10] *> lut4) = (tplh$cbit10$lut4, tphl$cbit10$lut4);
     (cbit[9] *> lut4) = (tplh$cbit9$lut4, tphl$cbit9$lut4);
     (cbit[8] *> lut4) = (tplh$cbit8$lut4, tphl$cbit8$lut4);
     (cbit[7] *> lut4) = (tplh$cbit7$lut4, tphl$cbit7$lut4);
     (cbit[6] *> lut4) = (tplh$cbit6$lut4, tphl$cbit6$lut4);
     (cbit[5] *> lut4) = (tplh$cbit5$lut4, tphl$cbit5$lut4);
     (cbit[4] *> lut4) = (tplh$cbit4$lut4, tphl$cbit4$lut4);
     (cbit[3] *> lut4) = (tplh$cbit3$lut4, tphl$cbit3$lut4);
     (cbit[2] *> lut4) = (tplh$cbit2$lut4, tphl$cbit2$lut4);
     (cbit[1] *> lut4) = (tplh$cbit1$lut4, tphl$cbit1$lut4);
     (cbit[0] *> lut4) = (tplh$cbit0$lut4, tphl$cbit0$lut4);
     (in3 *> lut4) = (tplh$in3$lut4, tphl$in3$lut4);
     (in2 *> lut4) = (tplh$in2$lut4, tphl$in2$lut4);
     (in1 *> lut4) = (tplh$in1$lut4, tphl$in1$lut4);
     (in0 *> lut4) = (tplh$in0$lut4, tphl$in0$lut4);     
     (in3b *> lut4) = (tplh$in3b$lut4, tphl$in3b$lut4);
     (in2b *> lut4) = (tplh$in2b$lut4, tphl$in2b$lut4);
     (in1b *> lut4) = (tplh$in1b$lut4, tphl$in1b$lut4);
     (in0b *> lut4) = (tplh$in0b$lut4, tphl$in0b$lut4);     
  endspecify
`endif

   always @(in0 or in1 or in2 or in3 or in0b or in1b or in2b or in3b or cbit)
      if ({in3, in2, in1, in0} != ~{in3b, in2b, in1b, in0b}) lut4 = 1'bx;
      //else if (cbit == 16'h0) lut4= 1'b0;
      else
      case ({in3, in2, in1, in0})
         4'b0000: lut4 = cbit[0] ;
         4'b0001: lut4 = cbit[1] ;
         4'b0010: lut4 = cbit[2] ;
         4'b0011: lut4 = cbit[3] ;
         4'b0100: lut4 = cbit[4] ;
         4'b0101: lut4 = cbit[5] ;
         4'b0110: lut4 = cbit[6] ;
         4'b0111: lut4 = cbit[7] ;
         4'b1000: lut4 = cbit[8] ;
         4'b1001: lut4 = cbit[9] ;
         4'b1010: lut4 = cbit[10] ;
         4'b1011: lut4 = cbit[11] ;
         4'b1100: lut4 = cbit[12] ;
         4'b1101: lut4 = cbit[13] ;
         4'b1110: lut4 = cbit[14] ;
         4'b1111: lut4 = cbit[15] ;
         default: lut4 = 1'bx;
        endcase


endmodule
