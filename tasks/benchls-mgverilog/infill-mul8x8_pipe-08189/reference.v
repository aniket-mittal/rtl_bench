module mg_08189(input CLK, input process_CE, input [15:0] inp, output [15:0] process_output);
parameter INSTANCE_NAME="INST"; 
  reg [15:0] unnamedbinop1553_delay1_validunnamednull0_CEprocess_CE; always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1553_delay1_validunnamednull0_CEprocess_CE <= {({8'b0,(inp[7:0])}*{8'b0,(inp[15:8])})}; end end 
  assign process_output = unnamedbinop1553_delay1_validunnamednull0_CEprocess_CE; 
 endmodule