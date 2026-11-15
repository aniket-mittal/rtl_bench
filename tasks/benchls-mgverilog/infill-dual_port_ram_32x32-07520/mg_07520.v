module mg_07520 (input clock_a,input [31:0] data_a,input wren_a,input [4:0] address_a,input clock_b,input [31:0] data_b,input wren_b,input [4:0] address_b,output reg [31:0] q_a,output reg [31:0] q_b);
reg [31:0] mem[31:0]; 
  [MASKED] 
  always @(posedge clock_b) begin 
  if (wren_b) mem[address_b] <= data_b; 
  q_b <= mem[address_b]; 
  end 
 endmodule