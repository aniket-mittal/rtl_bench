module mg_02637 (clk_in,enable,clk_out);
input clk_in ; 
 input enable ; 
 output clk_out ; 
 wire clk_in ; 
 wire enable ; 
 wire clk_out ; 
 reg [3:0] counter1 ; 
 reg [3:0] counter2 ; 
 reg toggle1 ; 
 reg toggle2 ; 
 [MASKED] 
 always @ (negedge clk_in) 
 if (enable == 1'b0) begin 
  counter2 <= 4'b0; 
  toggle2 <= 0; 
 end else if ((counter2 == 3 && ~toggle2) || (toggle2 && counter2 == 4)) begin 
  counter2 <= 4'b0; 
  toggle2 <= ~toggle2; 
 end else begin 
  counter2 <= counter2 + 1; 
 end 
 assign clk_out = (counter1 <3 && counter2 < 3) & enable; 
 endmodule