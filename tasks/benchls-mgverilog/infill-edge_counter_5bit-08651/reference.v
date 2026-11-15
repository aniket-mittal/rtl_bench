module mg_08651(input clk,input cen,input zero,output reg [4:0] cnt);
reg last_zero; 
 always @(posedge clk) if(cen) begin : proc_cnt 
  last_zero <= zero; 
  cnt <= (zero&&!last_zero) ? 5'd1 : cnt + 5'b1; 
 end 
 endmodule