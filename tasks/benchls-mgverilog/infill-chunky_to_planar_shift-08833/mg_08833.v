module mg_08833 (input clk,input reset,input [23:1] address_in,input [15:0] data_in,output [15:0] data_out,input rd,input sel_akiko);
reg [127:0] shifter; 
 reg [6:0] wrpointer; 
 wire sel; 
 assign sel = sel_akiko && address_in[7:1]==8'b0011_100; 
 always @(posedge clk) 
  if (reset) 
  wrpointer <= 0; 
  else if (!rd && sel) 
  begin 
  case(wrpointer) 
  0 : shifter[127:112] <= data_in[15:0]; 
  1 : shifter[111:96] <= data_in[15:0]; 
  2 : shifter[95:80] <= data_in[15:0]; 
  3 : shifter[79:64] <= data_in[15:0]; 
  4 : shifter[63:48] <= data_in[15:0]; 
  5 : shifter[47:32] <= data_in[15:0]; 
  6 : shifter[31:16] <= data_in[15:0]; 
  7 : shifter[15:0] <= data_in[15:0]; 
  endcase 
  wrpointer <= wrpointer + 1; 
  end 
  else if (rd && sel) 
  begin 
  shifter[127:0] <= {shifter[126:0],1'b0}; 
  wrpointer <= 0; 
  end 
  [MASKED] 
 endmodule