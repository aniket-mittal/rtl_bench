module mg_02412(clk, wr, data_in, data_out);
parameter width = 'd16; 
  input wire clk , wr ; 
  input wire [width-1:0] data_in ; 
  output wire [20:0] data_out ; 
  reg sign ; 
  reg [1:0] stclk ; 
  reg [4:0] shst ; 
  reg [3:0] five, four, three, two, one; 
  reg [width-1:0] data_in_buf ; 
  reg [20:0] data_out_buf ; 
  initial begin 
  stclk [1:0] <= 2'b0; 
  end 
  assign data_out = data_out_buf; 
  [MASKED] 
 endmodule