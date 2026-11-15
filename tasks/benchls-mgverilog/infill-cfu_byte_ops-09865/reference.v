module mg_09865 (input cmd_valid,output cmd_ready,input [9:0] cmd_payload_function_id,input [31:0] cmd_payload_inputs_0,input [31:0] cmd_payload_inputs_1,output rsp_valid,input rsp_ready,output [31:0] rsp_payload_outputs_0,input clk,input reset);
assign rsp_valid = cmd_valid; 
  assign cmd_ready = rsp_ready; 
  wire [31:0] cfu0; 
  assign cfu0[31:0] = cmd_payload_inputs_0[7:0] + cmd_payload_inputs_1[7:0] + 
  cmd_payload_inputs_0[15:8] + cmd_payload_inputs_1[15:8] + 
  cmd_payload_inputs_0[23:16] + cmd_payload_inputs_1[23:16] + 
  cmd_payload_inputs_0[31:24] + cmd_payload_inputs_1[31:24]; 
  wire [31:0] cfu1; 
  assign cfu1[31:24] = cmd_payload_inputs_0[7:0]; 
  assign cfu1[23:16] = cmd_payload_inputs_0[15:8]; 
  assign cfu1[15:8] = cmd_payload_inputs_0[23:16]; 
  assign cfu1[7:0] = cmd_payload_inputs_0[31:24]; 
  wire [31:0] cfu2; 
  genvar n; 
  generate 
  for (n=0; n<32; n=n+1) begin 
  assign cfu2[n] = cmd_payload_inputs_0[31-n]; 
  end 
  endgenerate 
  assign rsp_payload_outputs_0 = cmd_payload_function_id[1] ? cfu2 : 
  ( cmd_payload_function_id[0] ? cfu1 : cfu0); 
 endmodule