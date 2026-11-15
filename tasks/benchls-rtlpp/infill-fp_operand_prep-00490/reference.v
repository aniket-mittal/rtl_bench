module rtlpp_00490 (
    clk_i, 		
    opa_i,		
    opb_i,		
    fracta_28_o, 
    fractb_28_o,
    exp_o
);

   parameter FP_WIDTH = 32;
   parameter MUL_SERIAL = 0; 
   parameter MUL_COUNT = 11; 
   parameter FRAC_WIDTH = 23;
   parameter EXP_WIDTH = 8;
   parameter ZERO_VECTOR = 31'd0;
   parameter INF = 31'b1111111100000000000000000000000;
   parameter QNAN = 31'b1111111110000000000000000000000;
   parameter SNAN = 31'b1111111100000000000000000000001;

   input clk_i;
   input [FP_WIDTH-1:0] opa_i;
   input [FP_WIDTH-1:0] opb_i;
   
   output reg [FRAC_WIDTH+4:0] fracta_28_o = 0;
   output reg [FRAC_WIDTH+4:0] fractb_28_o = 0;
   output reg [EXP_WIDTH-1:0]  exp_o = 0;
   
   reg [EXP_WIDTH-1 : 0]       s_exp_o = 0;
   wire [FRAC_WIDTH+4 : 0]     s_fracta_28_o, s_fractb_28_o;
   wire [EXP_WIDTH-1 : 0]      s_expa;
   wire [EXP_WIDTH-1 : 0]      s_expb;
   wire [FRAC_WIDTH-1 : 0]     s_fracta;
   wire [FRAC_WIDTH-1 : 0]     s_fractb;
   wire [FRAC_WIDTH+4 : 0]     s_fracta_28;
   wire [FRAC_WIDTH+4 : 0]     s_fractb_28;
   wire [FRAC_WIDTH+4 : 0]     s_fract_sm_28;
   wire [FRAC_WIDTH+4 : 0]     s_fract_shr_28;
   
   reg [EXP_WIDTH-1 : 0]       s_exp_diff = 0;
   reg [5 : 0] 		       s_rzeros = 0;
   wire 		       s_expa_eq_expb;
   wire 		       s_expa_gt_expb;
   wire 		       s_fracta_1;
   wire 		       s_fractb_1;
   wire 		       s_op_dn, s_opa_dn, s_opb_dn;
   wire [1 : 0] 	       s_mux_diff;
   wire 		       s_mux_exp;
   wire 		       s_sticky;

   assign s_expa = opa_i[30:23];
   assign s_expb = opb_i[30:23];
   assign s_fracta = opa_i[22:0];
   assign s_fractb = opb_i[22:0];
   
   always @(posedge clk_i) begin
       exp_o <= s_exp_o;
       fracta_28_o <= s_fracta_28_o;
       fractb_28_o <= s_fractb_28_o;	
   end
   
   assign s_expa_eq_expb = (s_expa == s_expb);
   assign s_expa_gt_expb = (s_expa > s_expb);

   assign s_fracta_1 = |s_fracta;
   assign s_fractb_1 = |s_fractb; 
   
   assign s_opa_dn = !(|s_expa);
   assign s_opb_dn = !(|s_expb);
   assign s_op_dn = s_opa_dn | s_opb_dn; 

   assign s_mux_exp = s_expa_gt_expb;
   
   always @(posedge clk_i)
     s_exp_o <= s_mux_exp ? s_expa : s_expb;
   
   assign s_fracta_28 = s_opa_dn ? 
			{2'b00, s_fracta, 3'b000} : {2'b01, s_fracta, 3'b000};
   assign s_fractb_28 = s_opb_dn ? 
			{2'b00, s_fractb, 3'b000} : {2'b01, s_fractb, 3'b000};
   
   assign s_mux_diff = {s_expa_gt_expb, s_opa_dn ^ s_opb_dn};
   
   always @(posedge clk_i) begin
       case(s_mux_diff)
	   2'b00: s_exp_diff <= s_expb - s_expa;
	   2'b01: s_exp_diff <= s_expb - (s_expa + 8'd1);
	   2'b10: s_exp_diff <= s_expa - s_expb;
	   2'b11: s_exp_diff <= s_expa - (s_expb + 8'd1);
	endcase
   end
   
   assign s_fract_sm_28 =  s_expa_gt_expb ? s_fractb_28 : s_fracta_28;
   assign s_fract_shr_28 = s_fract_sm_28 >> s_exp_diff;

   always @(s_fract_sm_28) begin
      casez(s_fract_sm_28) 
         28'b???????????????????????????1: s_rzeros = 0;
         28'b??????????????????????????10: s_rzeros = 1;
         28'b?????????????????????????100: s_rzeros = 2;
         28'b????????????????????????1000: s_rzeros = 3;
         28'b???????????????????????10000: s_rzeros = 4;
         28'b??????????????????????100000: s_rzeros = 5;
         28'b?????????????????????1000000: s_rzeros = 6;
         28'b????????????????????10000000: s_rzeros = 7;
         28'b???????????????????100000000: s_rzeros = 8;
         28'b??????????????????1000000000: s_rzeros = 9;
         28'b?????????????????10000000000: s_rzeros = 10;
         28'b????????????????100000000000: s_rzeros = 11;
         28'b???????????????1000000000000: s_rzeros = 12;
         28'b??????????????10000000000000: s_rzeros = 13;
         28'b?????????????100000000000000: s_rzeros = 14;
         28'b????????????1000000000000000: s_rzeros = 15;
         28'b???????????10000000000000000: s_rzeros = 16;
         28'b??????????100000000000000000: s_rzeros = 17;
         28'b?????????1000000000000000000: s_rzeros = 18;
         28'b????????10000000000000000000: s_rzeros = 19;
         28'b???????100000000000000000000: s_rzeros = 20;
         28'b??????1000000000000000000000: s_rzeros = 21;
         28'b?????10000000000000000000000: s_rzeros = 22;
         28'b????100000000000000000000000: s_rzeros = 23;
         28'b???1000000000000000000000000: s_rzeros = 24;
         28'b??10000000000000000000000000: s_rzeros = 25;
         28'b?100000000000000000000000000: s_rzeros = 26;
         28'b1000000000000000000000000000: s_rzeros = 27;
         28'b0000000000000000000000000000: s_rzeros = 28;
      endcase 
   end
   
   assign s_sticky = (s_exp_diff > {2'b00, s_rzeros}) & (|s_fract_sm_28);
   assign s_fracta_28_o = s_expa_gt_expb ?
                          s_fracta_28 :
                          {s_fract_shr_28[27:1], (s_sticky | s_fract_shr_28[0])};
   
   assign s_fractb_28_o =  s_expa_gt_expb ? 
                           {s_fract_shr_28[27:1], (s_sticky | s_fract_shr_28[0])} :
                           s_fractb_28;

endmodule