module mg_07793(input [10:0] data_in,input crc_en,output [4:0] crc_out,input rst,input clk);
reg [4:0] lfsr_q,lfsr_c; 
  assign crc_out = ~lfsr_q; 
  [MASKED] 
  always @(posedge clk, posedge rst) begin 
  if(rst) begin 
  lfsr_q <= {5{1'b1}}; 
  end 
  else begin 
  lfsr_q <= crc_en ? lfsr_c : lfsr_q; 
  end 
  end 
 endmodule