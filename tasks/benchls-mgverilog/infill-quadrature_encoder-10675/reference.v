module mg_10675(input clock,input reset_l,input A,input B,output [31:0] CurrentCount,output Direction);
reg BPrevious; 
 reg APrevious; 
 reg ACurrent; 
 reg BCurrent; 
 reg[31:0] Count; 
 reg[31:0] CountOutput; 
 reg Dir; 
 reg DirectionOutput; 
 always @(posedge clock) begin 
  if (reset_l == 1'b0) 
  begin 
  Count[31:0] <= 32'h80000000; 
  end 
  else 
  begin 
  if( (APrevious != A) || (BPrevious != B)) 
  begin 
  if (A ^ BPrevious) 
  begin 
  Count <= Count + 1'b1; 
  Dir <= 1'b1; 
  end 
  else begin 
  Count <= Count - 1'b1; 
  Dir <= 1'b0; 
  end 
  end 
  end 
 end 
 always @(negedge clock) begin 
  APrevious <= A; 
  BPrevious <= B; 
  CountOutput <= Count; 
  DirectionOutput <= Dir; 
 end 
 assign CurrentCount = CountOutput; 
 assign Direction = DirectionOutput; 
 endmodule