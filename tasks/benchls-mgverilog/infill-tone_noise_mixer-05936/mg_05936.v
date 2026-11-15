module mg_05936 (input wire clk,input wire en_tone,input wire en_noise,input wire tone,input wire noise,input wire [3:0] amplitude_l,input wire [3:0] amplitude_r,output reg [4:0] out_l,output reg [4:0] out_r);
reg [4:0] next_out_l, next_out_r; 
  [MASKED] 
  always @(posedge clk) begin 
  out_l <= next_out_l; 
  out_r <= next_out_r; 
  end 
 endmodule