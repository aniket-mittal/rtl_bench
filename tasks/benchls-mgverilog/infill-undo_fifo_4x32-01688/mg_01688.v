module mg_01688(input [31:0] din,input wr_en,input rd_en,output [31:0] dout,input delete_en,input undo,output full,output empty,input reset,input clk);
parameter MAX_DEPTH_BITS = 2; 
 parameter MAX_DEPTH = 2 ** MAX_DEPTH_BITS; 
 reg [31:0] queue [MAX_DEPTH - 1 : 0]; 
 reg [MAX_DEPTH_BITS - 1 : 0] rd_ptr; 
 reg [MAX_DEPTH_BITS - 1 : 0] rd_ptr_backup; 
 reg [MAX_DEPTH_BITS - 1 : 0] wr_ptr; 
 reg [MAX_DEPTH_BITS - 1 + 1 : 0] depth; 
 always @(posedge clk) 
 begin 
  if (wr_en) 
  queue[wr_ptr] <= din; 
 end 
 [MASKED] 
 assign dout = queue[rd_ptr]; 
 assign full = depth == MAX_DEPTH; 
 assign empty = depth == 'h0; 
 always @(posedge clk) 
 begin 
  if (wr_en && depth == MAX_DEPTH && !delete_en) 
  ; 
  if ((rd_en || delete_en) && depth == 'h0) 
  ; 
 end 
 endmodule