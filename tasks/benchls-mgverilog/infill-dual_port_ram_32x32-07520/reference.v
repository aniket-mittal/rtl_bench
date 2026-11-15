module mg_07520 (input clock_a,input [31:0] data_a,input wren_a,input [4:0] address_a,input clock_b,input [31:0] data_b,input wren_b,input [4:0] address_b,output reg [31:0] q_a,output reg [31:0] q_b);
reg [31:0] mem[31:0]; 
  always @(posedge clock_a) begin 
  if (wren_a) begin 
  mem[address_a][7:0] <= data_a[7:0]; 
  mem[address_a][15:8] <= data_a[15:8]; 
  mem[address_a][23:16] <= data_a[23:16]; 
  mem[address_a][31:24] <= data_a[31:24]; 
  end 
  q_a <= mem[address_a]; 
  end 
  always @(posedge clock_b) begin 
  if (wren_b) mem[address_b] <= data_b; 
  q_b <= mem[address_b]; 
  end 
 endmodule