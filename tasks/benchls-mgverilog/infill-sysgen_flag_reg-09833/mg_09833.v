module mg_09833 (input [(1 - 1):0] d,input [(1 - 1):0] en,input [(1 - 1):0] rst,output [(1 - 1):0] q,input clk,input ce,input clr);
wire d_1_22; 
  wire en_1_25; 
  wire rst_1_29; 
  wire op_mem_0_8_24_next; 
  reg op_mem_0_8_24 = 1'b0; 
  wire op_mem_0_8_24_rst; 
  wire op_mem_0_8_24_en; 
  localparam [(1 - 1):0] const_value = 1'b1; 
  reg op_mem_0_join_10_5; 
  reg op_mem_0_join_10_5_en; 
  reg op_mem_0_join_10_5_rst; 
  assign d_1_22 = d; 
  assign en_1_25 = en; 
  assign rst_1_29 = rst; 
  always @(posedge clk) 
  begin:proc_op_mem_0_8_24 
  if (((ce == 1'b1) && (op_mem_0_8_24_rst == 1'b1))) 
  begin 
  op_mem_0_8_24 <= 1'b0; 
  end 
  else if (((ce == 1'b1) && (op_mem_0_8_24_en == 1'b1))) 
  begin 
  op_mem_0_8_24 <= op_mem_0_8_24_next; 
  end 
  end 
  [MASKED] 
  assign op_mem_0_8_24_next = d_1_22; 
  assign op_mem_0_8_24_rst = op_mem_0_join_10_5_rst; 
  assign op_mem_0_8_24_en = op_mem_0_join_10_5_en; 
  assign q = op_mem_0_8_24; 
 endmodule