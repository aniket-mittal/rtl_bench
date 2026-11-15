module mg_07931(input CLK, input CE, input [16:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST"; 
  wire [15:0] unnamedcast119USEDMULTIPLEcast;assign unnamedcast119USEDMULTIPLEcast = (process_input[15:0]); 
  assign process_output = (((process_input[16]))?((({(unnamedcast119USEDMULTIPLEcast==(16'd481))})?((16'd0)):({(unnamedcast119USEDMULTIPLEcast+(16'd1))}))):(unnamedcast119USEDMULTIPLEcast)); 
 endmodule