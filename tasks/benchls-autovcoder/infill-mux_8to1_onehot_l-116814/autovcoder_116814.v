module autovcoder_116814 (dout, in0, in1, in2, in3, 
			in4, in5, in6, in7,
		     sel0_l, sel1_l, sel2_l, sel3_l,
		     sel4_l, sel5_l, sel6_l, sel7_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input	[SIZE-1:0]	in4;
input	[SIZE-1:0]	in5;
input	[SIZE-1:0]	in6;
input	[SIZE-1:0]	in7;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;
input			sel4_l;
input			sel5_l;
input			sel6_l;
input			sel7_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

`ifdef VERPLEX
   $constraint dl_1c_chk8 ($one_cold ({sel7_l,sel6_l,sel5_l,sel4_l,
				       sel3_l,sel2_l,sel1_l,sel0_l}));
`endif

wire [7:0] sel = {sel7_l,sel6_l,sel5_l,sel4_l,
                  sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold

[MASKED]

endmodule
