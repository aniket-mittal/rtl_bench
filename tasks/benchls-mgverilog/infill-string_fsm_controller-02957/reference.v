module mg_02957 (Complete, NullString, NullDataChar, Generated, LoadString, CompareString, LoadNextChar, GenerateData, SendData, Reset, clk);
input Complete, NullString, NullDataChar, clk, Reset, Generated; 
  output reg LoadString, CompareString, LoadNextChar, GenerateData, SendData; 
  reg [2:0] current_state; 
  reg [2:0] next_state; 
  parameter Standby=3'b000, LoadingString=3'b001, ComparingString=3'b010, LoadingChar=3'b011; 
  parameter GeneratingData=3'b100, SendingData=3'b101; 
 always @(Complete, NullString, NullDataChar, current_state, Reset, Generated)begin 
  if (Reset)begin 
  next_state <= Standby; 
  LoadString<=0; 
  CompareString<=0; 
  LoadNextChar<=0; 
  GenerateData<=0; 
  SendData<=0; 
  end 
  else begin 
  case (current_state) 
  Standby: begin 
  if (Complete==1'b0) begin 
  LoadString<=0; 
  CompareString<=0; 
  LoadNextChar<=0; 
  GenerateData<=0; 
  SendData<=0; 
  next_state <= Standby; 
  end 
  else begin 
  next_state <= LoadingString; 
  LoadString<=0; 
  CompareString<=0; 
  LoadNextChar<=0; 
  GenerateData<=0; 
  SendData<=0; 
  end 
  end 
  LoadingString: begin 
  LoadString<=1; 
  CompareString<=0; 
  LoadNextChar<=0; 
  GenerateData<=0; 
  SendData<=0; 
  next_state<=ComparingString; 
  end 
  ComparingString: begin 
  LoadString<=0; 
  CompareString<=1; 
  LoadNextChar<=0; 
  GenerateData<=0; 
  SendData<=0; 
  if (NullString==1'b1)next_state<=Standby; 
  else next_state<=LoadingChar; 
  end 
  LoadingChar: begin 
  LoadString<=0; 
  CompareString<=0; 
  LoadNextChar<=1; 
  GenerateData<=0; 
  SendData<=0; 
  next_state<=GeneratingData; 
  end 
  GeneratingData: begin 
  LoadString<=0; 
  CompareString<=0; 
  LoadNextChar<=0; 
  GenerateData<=1; 
  SendData<=0; 
  if (Generated)next_state <= SendingData; 
  else next_state <= GeneratingData; 
  end 
  SendingData: begin 
  LoadString<=0; 
  CompareString<=0; 
  LoadNextChar<=0; 
  GenerateData<=0; 
  SendData<=1; 
  if (NullDataChar == 1)next_state <= ComparingString; 
  else next_state <= SendingData; 
  end 
  default: begin 
  LoadString<=0; 
  CompareString<=0; 
  LoadNextChar<=0; 
  GenerateData<=0; 
  SendData<=0; 
  next_state <= Standby; 
  end 
  endcase 
  end 
 end 
  always @(negedge clk) begin 
  current_state <= next_state; 
  end 
 endmodule