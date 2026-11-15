module rtlpp_08286 
  (  
     clk,
     rst,
     fracta_i,
     fractb_i,
     signa_i,
     signb_i,
     start_i,
     fract_o,
     sign_o,
     ready_o
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
   
   input clk;
   input rst;
   
   input [FRAC_WIDTH:0] fracta_i;   
   input [FRAC_WIDTH:0] fractb_i;   
   input        signa_i;
   input        signb_i;
   input        start_i;
   output reg [2*FRAC_WIDTH+1:0] fract_o;
   output reg        sign_o;
   output reg        ready_o;
   
   localparam t_state_waiting = 1'b0,
              t_state_busy = 1'b1;

   reg [47:0]    s_fract_o;
   reg [23:0]    s_fracta_i;
   reg [23:0]    s_fractb_i;
   reg           s_signa_i, s_signb_i;
   wire          s_sign_o;
   reg           s_start_i;
   reg           s_ready_o;
   reg           s_state;
   reg [4:0]     s_count;
   wire [23:0]   s_tem_prod;

   always @(posedge clk or posedge rst) 
     if (rst)
       begin 
          s_fracta_i <= 'd0;
          s_fractb_i <= 'd0;
          s_signa_i <= 1'b0;
          s_signb_i <= 1'b0;
          s_start_i <= 1'b0;
       end
     else 
       begin
          s_fracta_i <= fracta_i[FRAC_WIDTH-1:0];
          s_fractb_i <= fractb_i[FRAC_WIDTH-1:0];
          s_signa_i <= signa_i;
          s_signb_i <= signb_i;
          s_start_i <= start_i;
       end
   
   always @(posedge clk or posedge rst) 
     if (rst) 
       begin
          fract_o <= 'd0;
          sign_o <= 1'b0;
          ready_o <= 1'b0;
       end
     else 
       begin
          fract_o <= s_fract_o;
          sign_o <= s_sign_o;    
          ready_o <= s_ready_o;
       end

   assign s_sign_o = s_signa_i ^ s_signb_i;

   always @(posedge clk or posedge rst) 
     if (rst)
       begin
          s_state <= t_state_waiting;
          s_count <= 0;
       end
     else 
       if (s_start_i)
         begin
            s_state <= t_state_busy;
            s_count <= 0;
         end
       else if (s_count==23)
         begin
            s_state <= t_state_waiting;
            s_ready_o <= 1;
            s_count <=0;
         end
       else if (s_state==t_state_busy)
         s_count <= s_count + 1;
       else
         begin
            s_state <= t_state_waiting;
            s_ready_o <= 0;
         end
   
   assign s_tem_prod[ 0] = s_fracta_i[ 0] & s_fractb_i[s_count];
   assign s_tem_prod[ 1] = s_fracta_i[ 1] & s_fractb_i[s_count];
   assign s_tem_prod[ 2] = s_fracta_i[ 2] & s_fractb_i[s_count];
   assign s_tem_prod[ 3] = s_fracta_i[ 3] & s_fractb_i[s_count];
   assign s_tem_prod[ 4] = s_fracta_i[ 4] & s_fractb_i[s_count];
   assign s_tem_prod[ 5] = s_fracta_i[ 5] & s_fractb_i[s_count];
   assign s_tem_prod[ 6] = s_fracta_i[ 6] & s_fractb_i[s_count];
   assign s_tem_prod[ 7] = s_fracta_i[ 7] & s_fractb_i[s_count];
   assign s_tem_prod[ 8] = s_fracta_i[ 8] & s_fractb_i[s_count];
   assign s_tem_prod[ 9] = s_fracta_i[ 9] & s_fractb_i[s_count];
   assign s_tem_prod[10] = s_fracta_i[10] & s_fractb_i[s_count];
   assign s_tem_prod[11] = s_fracta_i[11] & s_fractb_i[s_count];
   assign s_tem_prod[12] = s_fracta_i[12] & s_fractb_i[s_count];
   assign s_tem_prod[13] = s_fracta_i[13] & s_fractb_i[s_count];
   assign s_tem_prod[14] = s_fracta_i[14] & s_fractb_i[s_count];
   assign s_tem_prod[15] = s_fracta_i[15] & s_fractb_i[s_count];
   assign s_tem_prod[16] = s_fracta_i[16] & s_fractb_i[s_count];
   assign s_tem_prod[17] = s_fracta_i[17] & s_fractb_i[s_count];
   assign s_tem_prod[18] = s_fracta_i[18] & s_fractb_i[s_count];
   assign s_tem_prod[19] = s_fracta_i[19] & s_fractb_i[s_count];
   assign s_tem_prod[20] = s_fracta_i[20] & s_fractb_i[s_count];
   assign s_tem_prod[21] = s_fracta_i[21] & s_fractb_i[s_count];
   assign s_tem_prod[22] = s_fracta_i[22] & s_fractb_i[s_count];
   assign s_tem_prod[23] = s_fracta_i[23] & s_fractb_i[s_count];
   
   wire [47:0] v_prod_shl;
   assign v_prod_shl = {24'd0,s_tem_prod} << s_count[4:0];

   always @(posedge clk or posedge rst) 
     if (rst)
       s_fract_o <= 'd0; 
     else
       if (s_state==t_state_busy)
         begin
            if (|s_count)
              s_fract_o <= v_prod_shl + s_fract_o;
            else
              s_fract_o <= v_prod_shl;
         end
   
endmodule