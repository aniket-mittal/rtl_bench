module rtlpp_00534
(
   input             clk,
   input             rst,
   input             flush_i,  
   input             adv_i,    
   input             start_i,  
   input             is_sub_i, 
   
   input             signa_i,
   input       [9:0] exp10a_i,
   input      [23:0] fract24a_i,
   input             infa_i,
   
   input             signb_i,
   input       [9:0] exp10b_i,
   input      [23:0] fract24b_i,
   input             infb_i,
   
   input             snan_i,
   input             qnan_i,
   input             anan_sign_i,
   input             addsub_agtb_i,
   input             addsub_aeqb_i,
   
   output reg        add_rdy_o,       
   output reg        add_sign_o,      
   output reg        add_sub_0_o,     
   output reg  [4:0] add_shl_o,       
   output reg  [9:0] add_exp10shl_o,  
   output reg  [9:0] add_exp10sh0_o,  
   output reg [27:0] add_fract28_o,   
   output reg        add_inv_o,       
   output reg        add_inf_o,       
   output reg        add_snan_o,      
   output reg        add_qnan_o,      
   output reg        add_anan_sign_o  
);
  
  wire s1t_inv = infa_i & infb_i & (signa_i ^ (is_sub_i ^ signb_i));
  wire s1t_inf_i = infa_i | infb_i;
  wire s1t_calc_signa = signa_i;
  wire s1t_calc_signb = (signb_i ^ is_sub_i);

  wire [23:0] s1t_fract24_nsh = addsub_agtb_i ? fract24a_i : fract24b_i;
  wire [23:0] s1t_fract24_fsh = addsub_agtb_i ? fract24b_i : fract24a_i;
  wire [9:0] s1t_exp_diff = addsub_agtb_i ? (exp10a_i - exp10b_i) : (exp10b_i - exp10a_i);
  wire [4:0] s1t_shr = s1t_exp_diff[4:0] | {5{|s1t_exp_diff[9:5]}};

  reg s1o_inv, s1o_inf_i, s1o_snan_i, s1o_qnan_i, s1o_anan_i_sign;
  reg s1o_aeqb;
  reg [4:0] s1o_shr;
  reg s1o_sign_nsh;
  reg s1o_op_sub;
  reg [9:0] s1o_exp10c;
  reg [23:0] s1o_fract24_nsh;
  reg [23:0] s1o_fract24_fsh;

  always @(posedge clk) begin
    if(adv_i) begin
      s1o_inv         <= s1t_inv;
      s1o_inf_i       <= s1t_inf_i;
      s1o_snan_i      <= snan_i;
      s1o_qnan_i      <= qnan_i;
      s1o_anan_i_sign <= anan_sign_i;
      s1o_aeqb        <= addsub_aeqb_i;
      s1o_shr         <= s1t_shr & {5{~s1t_inf_i}};
      s1o_sign_nsh    <= addsub_agtb_i ? s1t_calc_signa : s1t_calc_signb;
      s1o_op_sub      <= s1t_calc_signa ^ s1t_calc_signb;
      s1o_exp10c      <= addsub_agtb_i ? exp10a_i : exp10b_i;
      s1o_fract24_nsh <= s1t_fract24_nsh & {24{~s1t_inf_i}};
      s1o_fract24_fsh <= s1t_fract24_fsh & {24{~s1t_inf_i}};
    end 
  end 

  reg s1o_ready;
  always @(posedge clk or posedge rst) begin
    if (rst)
      s1o_ready  <= 0;
    else if(flush_i)
      s1o_ready  <= 0;
    else if(adv_i)
      s1o_ready <= start_i;
  end

  wire [25:0] s2t_fract26_fsh = {s1o_fract24_fsh,2'd0};
  wire [25:0] s2t_fract26_shr = s2t_fract26_fsh >> s1o_shr;
  
  reg s2t_sticky;
  always @(s1o_shr or s1o_fract24_fsh) begin
    case(s1o_shr)
      5'd0, 5'd1, 5'd2 : s2t_sticky = 1'b0; 
      5'd3 : s2t_sticky = s1o_fract24_fsh[0];
      5'd4 : s2t_sticky = |s1o_fract24_fsh[1:0];
      5'd5 : s2t_sticky = |s1o_fract24_fsh[2:0];
      5'd6 : s2t_sticky = |s1o_fract24_fsh[3:0];
      5'd7 : s2t_sticky = |s1o_fract24_fsh[4:0];
      5'd8 : s2t_sticky = |s1o_fract24_fsh[5:0];
      5'd9 : s2t_sticky = |s1o_fract24_fsh[6:0];
      5'd10: s2t_sticky = |s1o_fract24_fsh[7:0];
      5'd11: s2t_sticky = |s1o_fract24_fsh[8:0];
      5'd12: s2t_sticky = |s1o_fract24_fsh[9:0];
      5'd13: s2t_sticky = |s1o_fract24_fsh[10:0];
      5'd14: s2t_sticky = |s1o_fract24_fsh[11:0];
      5'd15: s2t_sticky = |s1o_fract24_fsh[12:0];
      5'd16: s2t_sticky = |s1o_fract24_fsh[13:0];
      5'd17: s2t_sticky = |s1o_fract24_fsh[14:0];
      5'd18: s2t_sticky = |s1o_fract24_fsh[15:0];
      5'd19: s2t_sticky = |s1o_fract24_fsh[16:0];
      5'd20: s2t_sticky = |s1o_fract24_fsh[17:0];
      5'd21: s2t_sticky = |s1o_fract24_fsh[18:0];
      5'd22: s2t_sticky = |s1o_fract24_fsh[19:0];
      5'd23: s2t_sticky = |s1o_fract24_fsh[20:0];
      5'd24: s2t_sticky = |s1o_fract24_fsh[21:0];
      5'd25: s2t_sticky = |s1o_fract24_fsh[22:0];
      default: s2t_sticky = |s1o_fract24_fsh[23:0];
    endcase
  end

  wire [27:0] s2t_fract28_shr = {1'b0,s2t_fract26_shr,s2t_sticky};
  wire [27:0] s2t_fract28_add = {1'b0,s1o_fract24_nsh,3'd0} +
                                (s2t_fract28_shr ^ {28{s1o_op_sub}}) +
                                {27'd0,s1o_op_sub};

  reg s2o_inv, s2o_inf_i, s2o_snan_i, s2o_qnan_i, s2o_anan_i_sign;
  reg s2o_signc;
  reg [9:0]  s2o_exp10c;
  reg [26:0] s2o_fract27;
  reg s2o_sub_0;       
  reg s2o_sticky;      

  always @(posedge clk) begin
    if(adv_i) begin
      s2o_inv         <= s1o_inv;
      s2o_inf_i       <= s1o_inf_i;
      s2o_snan_i      <= s1o_snan_i;
      s2o_qnan_i      <= s1o_qnan_i;
      s2o_anan_i_sign <= s1o_anan_i_sign;
      s2o_signc       <= s1o_sign_nsh;
      s2o_exp10c      <= s1o_exp10c;
      s2o_fract27     <= s2t_fract28_add[27:1];
      s2o_sub_0       <= s1o_aeqb & s1o_op_sub;
      s2o_sticky      <= s2t_sticky;
    end 
  end 

  reg s2o_ready;
  always @(posedge clk or posedge rst) begin
    if (rst)
      s2o_ready  <= 0;
    else if(flush_i)
      s2o_ready  <= 0;
    else if(adv_i)
      s2o_ready <= s1o_ready;
  end

  reg [4:0] s3t_nlz;
  always @(s2o_fract27) begin
    casez(s2o_fract27)
      27'b1??????????????????????????: s3t_nlz <=  0; 
      27'b01?????????????????????????: s3t_nlz <=  0; 
      27'b001????????????????????????: s3t_nlz <=  1;
      27'b0001???????????????????????: s3t_nlz <=  2;
      27'b00001??????????????????????: s3t_nlz <=  3;
      27'b000001?????????????????????: s3t_nlz <=  4;
      27'b0000001????????????????????: s3t_nlz <=  5;
      27'b00000001???????????????????: s3t_nlz <=  6;
      27'b000000001??????????????????: s3t_nlz <=  7;
      27'b0000000001?????????????????: s3t_nlz <=  8;
      27'b00000000001????????????????: s3t_nlz <=  9;
      27'b000000000001???????????????: s3t_nlz <= 10;
      27'b0000000000001??????????????: s3t_nlz <= 11;
      27'b00000000000001?????????????: s3t_nlz <= 12;
      27'b000000000000001????????????: s3t_nlz <= 13;
      27'b0000000000000001???????????: s3t_nlz <= 14;
      27'b00000000000000001??????????: s3t_nlz <= 15;
      27'b000000000000000001?????????: s3t_nlz <= 16;
      27'b0000000000000000001????????: s3t_nlz <= 17;
      27'b00000000000000000001???????: s3t_nlz <= 18;
      27'b000000000000000000001??????: s3t_nlz <= 19;
      27'b0000000000000000000001?????: s3t_nlz <= 20;
      27'b00000000000000000000001????: s3t_nlz <= 21;
      27'b000000000000000000000001???: s3t_nlz <= 22;
      27'b0000000000000000000000001??: s3t_nlz <= 23;
      27'b00000000000000000000000001?: s3t_nlz <= 24;
      27'b000000000000000000000000001: s3t_nlz <= 25;
      27'b000000000000000000000000000: s3t_nlz <=  0; 
    endcase
  end 

  wire [4:0] s3t_nlz_m1    = (s3t_nlz - 5'd1);
  wire [9:0] s3t_exp10c_m1 = s2o_exp10c - 10'd1;
  wire [9:0] s3t_exp10c_mz = s2o_exp10c - {5'd0,s3t_nlz};
  wire [4:0] s3t_shl;
  wire [9:0] s3t_exp10shl;
  assign {s3t_shl,s3t_exp10shl} =
    (~(|s3t_nlz) | (s2o_exp10c == 10'd1)) ? {5'd0,s2o_exp10c} :
    (s2o_exp10c > s3t_nlz) ? {s3t_nlz,s3t_exp10c_mz} :
    (s2o_exp10c == s3t_nlz) ? {s3t_nlz_m1,10'd1} :
                              {s3t_exp10c_m1[4:0],10'd1};

  always @(posedge clk) begin
    if(adv_i) begin
      add_inv_o       <= s2o_inv;
      add_inf_o       <= s2o_inf_i;
      add_snan_o      <= s2o_snan_i;
      add_qnan_o      <= s2o_qnan_i;
      add_anan_sign_o <= s2o_anan_i_sign;
      add_sign_o      <= s2o_signc;
      add_sub_0_o     <= s2o_sub_0;
      add_shl_o       <= s3t_shl;
      add_exp10shl_o  <= s3t_exp10shl;
      add_exp10sh0_o  <= s2o_exp10c;
      add_fract28_o   <= {s2o_fract27,s2o_sticky};
    end 
  end 

  always @(posedge clk or posedge rst) begin
    if (rst)
      add_rdy_o <= 0;
    else if(flush_i)
      add_rdy_o <= 0;
    else if(adv_i)
      add_rdy_o <= s2o_ready;
  end

endmodule