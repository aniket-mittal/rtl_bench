module rtlpp_09608 (clock, reset, i_d, i_v, i_b, o_d, o_v, o_b, count);

   parameter depth = 16;
   parameter width = 16;

   parameter addrwidth =
         (  (((depth))     ==0) ? 0
          : (((depth-1)>>0)==0) ? 0
          : (((depth-1)>>1)==0) ? 1
          : (((depth-1)>>2)==0) ? 2
          : (((depth-1)>>3)==0) ? 3
          : (((depth-1)>>4)==0) ? 4
          : (((depth-1)>>5)==0) ? 5
          : (((depth-1)>>6)==0) ? 6
          : (((depth-1)>>7)==0) ? 7
          :                       8);

   input clock;
   input reset;

   input  [width-1:0] i_d;
   input              i_v;
   output             i_b;

   output [width-1:0] o_d;
   output             o_v;
   input              o_b;

   output [addrwidth:0] count;

   reg    [addrwidth-1:0] addr, addr_, a_;
   reg                    shift_en_;
   reg    [width-1:0]     srl [depth-2:0];
   reg                    shift_en_o_;
   reg    [width-1:0]     srlo_, srlo;

   parameter state_empty = 2'd0;
   parameter state_one   = 2'd1;
   parameter state_more  = 2'd2;

   reg [1:0] state, state_;

   wire      addr_full_;
   reg       addr_full;
   wire      addr_zero_;
   wire      o_v_reg_;
   reg       o_v_reg;
   wire      i_b_reg_;
   reg       i_b_reg;

   assign addr_full_ = (state_ == state_more) && (addr_ == depth-2);
   assign addr_zero_ = (addr == 0);
   assign o_v_reg_   = (state_ != state_empty);
   assign i_b_reg_   = addr_full_;
   assign o_d = srlo;
   assign o_v = o_v_reg;
   assign i_b = i_b_reg;
   assign count = (state == state_more ? addr+2 : (state == state_one ? 1 : 0));

   always @(posedge clock) begin
      if (reset) begin
         state     <= state_empty;
         addr      <= 0;
         addr_full <= 0;
         o_v_reg   <= 0;
         i_b_reg   <= 1;
      end
      else begin
         state     <= state_;
         addr      <= addr_;
         addr_full <= addr_full_;
         o_v_reg   <= o_v_reg_;
         i_b_reg   <= i_b_reg_;
      end
   end

   always @(posedge clock) begin
      if (reset) begin
         srlo <= 0;
      end
      else begin
         if (shift_en_o_) begin
            srlo <= srlo_;
         end
      end
   end

   always @(posedge clock) begin
      if (shift_en_) begin
         for (a_ = depth-2; a_ > 0; a_ = a_ - 1) begin
            srl[a_] <= srl[a_-1];
         end
         srl[0] <= i_d;
      end
   end

   [MASKED]

endmodule