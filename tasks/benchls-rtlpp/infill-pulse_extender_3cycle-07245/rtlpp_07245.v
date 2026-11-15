module rtlpp_07245(B, X, Clk, Rst);

input B;
output reg X;
input Clk, Rst;

parameter S_Off = 2'd0, S_On1 = 2'd1, S_On2 = 2'd2, S_On3 = 2'd3;

reg [1:0] State, StateNext; 

[MASKED]

always @(posedge Clk or posedge Rst) begin
  if (Rst) 
    State <= S_Off;
  else 
    State <= StateNext;
end

endmodule