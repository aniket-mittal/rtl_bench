module mg_00668 (input [(3 - 1):0] a,input [(6 - 1):0] b,input [(1 - 1):0] en,output [(1 - 1):0] op,input clk,input ce,input clr);
wire [(3 - 1):0] a_1_31; 
  wire [(6 - 1):0] b_1_34; 
  wire en_1_37; 
  reg op_mem_32_22[0:(1 - 1)]; 
  initial 
  begin 
  op_mem_32_22[0] = 1'b0; 
  end 
  wire op_mem_32_22_front_din; 
  wire op_mem_32_22_back; 
  wire op_mem_32_22_push_front_pop_back_en; 
  localparam [(1 - 1):0] const_value = 1'b1; 
  wire [(6 - 1):0] cast_14_12; 
  wire result_14_3_rel; 
  reg op_mem_shift_join_34_3; 
  reg op_mem_shift_join_34_3_en; 
  assign a_1_31 = a; 
  assign b_1_34 = b; 
  assign en_1_37 = en; 
  assign op_mem_32_22_back = op_mem_32_22[0]; 
  always @(posedge clk) 
  begin:proc_op_mem_32_22 
  integer i; 
  if (((ce == 1'b1) && (op_mem_32_22_push_front_pop_back_en == 1'b1))) 
  begin 
  op_mem_32_22[0] <= op_mem_32_22_front_din; 
  end 
  end 
  assign cast_14_12 = {3'b000, a_1_31[2:0]}; 
  assign result_14_3_rel = cast_14_12 != b_1_34; 
  always @(en_1_37 or result_14_3_rel) 
  begin:proc_if_34_3 
  if (en_1_37) 
  begin 
  op_mem_shift_join_34_3_en = 1'b1; 
  end 
  else 
  begin 
  op_mem_shift_join_34_3_en = 1'b0; 
  end 
  op_mem_shift_join_34_3 = result_14_3_rel; 
  end 
  assign op_mem_32_22_front_din = op_mem_shift_join_34_3; 
  assign op_mem_32_22_push_front_pop_back_en = op_mem_shift_join_34_3_en; 
  assign op = op_mem_32_22_back; 
 endmodule