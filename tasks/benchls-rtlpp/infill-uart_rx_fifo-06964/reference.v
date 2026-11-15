module rtlpp_06964
  (
   input 	    clk,                  
   input 	    rst_n,                
   input 	    rx,                   
   output reg [7:0] rx_fifo_data = 8'b0,  
   output reg 	    rx_fifo_wr_en = 1'b0, 
   input 	    rx_fifo_full          
   );

   function integer clogb2;
      input integer value;
      begin
        clogb2 = 0;
        while (value > 0) begin
          clogb2 = clogb2 + 1;
          value = value >> 1;
        end
      end
   endfunction 

   parameter P_CLK_FREQ_HZ = 100000000;
   parameter P_BAUD_RATE = 9600;
        
   reg [1:0] 	    fsm=2'd0;
   localparam
     S_IDLE  = 2'd0, 
     S_START = 2'd1, 
     S_SHIFT = 2'd2, 
     S_STOP  = 2'd3; 
         
   reg 	    rx_s, rx_s_nedge;
   reg 	    rx_reg1, rx_reg2, rx_nedge_reg1, rx_nedge_reg2;
   
   always @(posedge clk or negedge rst_n) begin
     if (!rst_n) begin
       rx_reg1 <= 1'b0;
       rx_reg2 <= 1'b0;
       rx_nedge_reg1 <= 1'b1;
       rx_nedge_reg2 <= 1'b1;
     end else begin
       rx_reg1 <= rx;
       rx_reg2 <= rx_reg1;
       rx_s <= rx_reg2;
       rx_nedge_reg1 <= rx_reg2;
       rx_nedge_reg2 <= rx_nedge_reg1;
       rx_s_nedge <= rx_nedge_reg1 & ~rx_nedge_reg2;
     end
   end
   
   localparam START_LATCH_CNT_MAX = P_CLK_FREQ_HZ/P_BAUD_RATE/2;
   localparam SHIFT_LATCH_CNT_MAX = P_CLK_FREQ_HZ/P_BAUD_RATE;
   localparam STOP_LATCH_CNT_MAX = P_CLK_FREQ_HZ/P_BAUD_RATE;
   localparam NBITS_LATCH_CNT = clogb2(SHIFT_LATCH_CNT_MAX);
   reg [NBITS_LATCH_CNT-1:0]  latch_cnt={NBITS_LATCH_CNT{1'b0}};

   reg [2:0] 	    shift_cnt=3'd0;

   always @(posedge clk or negedge rst_n) begin
     if( !rst_n ) 
       rx_fifo_wr_en <= 1'b0;
     else if( (fsm == S_STOP) && (latch_cnt == STOP_LATCH_CNT_MAX) && (rx_s == 1'b1) && !rx_fifo_full ) 
       rx_fifo_wr_en <= 1'b1;
     else 
       rx_fifo_wr_en <= 1'b0;
   end

   always @(posedge clk or negedge rst_n) begin
     if( !rst_n ) begin
       latch_cnt <= {NBITS_LATCH_CNT{1'b0}}; 
       shift_cnt <= 3'd0; 
       rx_fifo_data <= 8'd0;
       fsm <= S_IDLE;
     end else begin
       case( fsm )
         S_IDLE: begin
           latch_cnt <= {NBITS_LATCH_CNT-1{1'b0}};
           shift_cnt <= 3'd0;
           if( rx_s_nedge )
             fsm <= S_START;
         end
         S_START: begin
           if( latch_cnt == START_LATCH_CNT_MAX ) begin
             latch_cnt <= {NBITS_LATCH_CNT-1{1'b0}}; 
             fsm <= S_SHIFT; 
           end else
             latch_cnt <= latch_cnt + 1'b1;
         end
         S_SHIFT: begin
           if( (shift_cnt == 3'd7) && (latch_cnt == SHIFT_LATCH_CNT_MAX) ) begin
             rx_fifo_data <= {rx_s,rx_fifo_data[7:1]}; 
             shift_cnt <= 3'b0;
             latch_cnt <= {NBITS_LATCH_CNT-1{1'b0}}; 
             fsm <= S_STOP;  
           end else if( latch_cnt == SHIFT_LATCH_CNT_MAX ) begin
             rx_fifo_data <= {rx_s,rx_fifo_data[7:1]}; 
             shift_cnt <= shift_cnt + 1'b1;
             latch_cnt <= {NBITS_LATCH_CNT-1{1'b0}};
           end else
             latch_cnt <= latch_cnt + 1'b1;
         end
         S_STOP: begin
           if( latch_cnt == STOP_LATCH_CNT_MAX  ) begin 
             latch_cnt <= {NBITS_LATCH_CNT-1{1'b0}}; 
             fsm <= S_IDLE;
           end else
             latch_cnt <= latch_cnt + 1'b1;
         end
         default: 
           fsm <= S_IDLE;
       endcase
     end
   end

endmodule