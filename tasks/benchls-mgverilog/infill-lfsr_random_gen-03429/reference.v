module mg_03429(input [15:0] seed ,output [15:0] randnum ,input generate_next ,input reset ,input clk);
reg [15:0] lfsr; 
  wire lfsr_xnor; 
 always @(posedge clk) begin 
  if (reset) begin 
  lfsr <= seed; 
  end else if(generate_next) begin 
  lfsr <= {lfsr_xnor,lfsr[15:1]}; 
  end 
 end 
 assign randnum = lfsr; 
 assign lfsr_xnor = (lfsr[12] ^ lfsr[3] ^ lfsr[1]^ lfsr[0]) ? 1'd0 : 1'd1; 
 endmodule