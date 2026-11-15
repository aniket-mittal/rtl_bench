module mg_10585 (input wire clk,input wire rst_n,output wire done);
reg [3:0] counter; 
  always @(posedge clk or negedge rst_n) begin 
  if (rst_n & ! clk) begin 
 ; 
  ; 
  end 
  if (! rst_n) begin 
  counter <= 4'd0; 
  end else begin 
  counter <= counter < 4'd15 ? counter + 4'd1 : counter; 
  end 
  end 
  assign done = rst_n & (counter == 4'd15); 
 endmodule