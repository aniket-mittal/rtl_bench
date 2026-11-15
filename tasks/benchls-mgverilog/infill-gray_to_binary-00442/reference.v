module mg_00442(gray_val,bin_val);
parameter width = 8; 
  input [width-1:0] gray_val; 
  output reg [width-1:0] bin_val; 
  integer i; 
  always @* 
  begin 
  bin_val[width-1] = gray_val[width-1]; 
  for(i=width-2;i>=0;i=i-1) 
  bin_val[i] = bin_val[i+1] ^ gray_val[i]; 
  end 
 endmodule