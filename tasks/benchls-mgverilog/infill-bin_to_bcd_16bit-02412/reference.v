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
  always@(posedge clk) begin 
  case(stclk) 
  2'b00: begin 
  if(!wr) begin 
  stclk [1:0] <= 2'b01; 
  data_in_buf [width-1:0] <= data_in [width-1:0]; 
  sign <= 1'b0; 
  shst [4:0] <= 5'b0; 
  five [3:0] <= 4'b0; 
  four [3:0] <= 4'b0; 
  three [3:0] <= 4'b0; 
  two [3:0] <= 4'b0; 
  one [3:0] <= 4'b0; 
  end 
  end 
  2'b01: begin 
  stclk [1:0] <= 2'b10; 
  if(data_in_buf[width-1]) begin 
  sign <= 1'b1; 
  data_in_buf [width-1:0] <= ~data_in_buf [width-1:0] + 1'b1; 
  end 
  end 
  2'b10: begin 
  stclk [1:0] <= 2'b11; 
  shst [4:0] <= shst + 1'b1; 
  {five, four, three, two, one, data_in_buf} <= {five, four, three, two, one, data_in_buf} << 1; 
  end 
  2'b11: begin 
  if(shst [4:0] == (width)) begin 
  stclk [1:0] <= 2'b00; 
  data_out_buf [20:0] <= {sign, five, four, three, two, one}; 
  end else begin 
  stclk [1:0] <= 2'b10; 
  if(five [3:0] >= 4'b0101) five [3:0] <= five [3:0] + 2'b11; 
  if(four [3:0] >= 4'b0101) four [3:0] <= four [3:0] + 2'b11; 
  if(three [3:0] >= 4'b0101) three [3:0] <= three [3:0] + 2'b11; 
  if(two [3:0] >= 4'b0101) two [3:0] <= two [3:0] + 2'b11; 
  if(one [3:0] >= 4'b0101) one [3:0] <= one [3:0] + 2'b11; 
  end 
  end 
  endcase 
  end 
 endmodule