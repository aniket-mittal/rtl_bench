module mg_02957 (Complete, NullString, NullDataChar, Generated, LoadString, CompareString, LoadNextChar, GenerateData, SendData, Reset, clk);
input Complete, NullString, NullDataChar, clk, Reset, Generated; 
  output reg LoadString, CompareString, LoadNextChar, GenerateData, SendData; 
  reg [2:0] current_state; 
  reg [2:0] next_state; 
  parameter Standby=3'b000, LoadingString=3'b001, ComparingString=3'b010, LoadingChar=3'b011; 
  parameter GeneratingData=3'b100, SendingData=3'b101; 
 [MASKED] 
  always @(negedge clk) begin 
  current_state <= next_state; 
  end 
 endmodule