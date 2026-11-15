module rtlpp_07238(B, X, Clk, Rst);

input B;
output reg X;
input Clk, Rst;

parameter S_Off = 2'b00, S_On1 = 2'b01, S_On2 = 2'b10, S_On3 = 2'b11;

reg [1:0] State, StateNext; 

always @(State or B) begin 
  case (State)
	S_Off: begin
		X = 0; 
		if (B == 0) 
			StateNext = S_Off;
		else
			StateNext = S_On1;
		end
	S_On1: begin
		X = 1;
		StateNext = S_On2;
		end
	S_On2: begin
		X = 1;
		StateNext = S_On3;
		end
	S_On3: begin
		X = 1;
		StateNext = S_Off;
		end
  endcase
end

always @(posedge Clk) begin
  if (Rst == 1)
	State <= S_Off;
  else 
	State <= StateNext;
end

endmodule