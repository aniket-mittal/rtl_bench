module BUFGCE(
  I,
  CE,
  O
);

input  I;
input  CE ;
output O;

reg    clk_en_af_latch;
always @(I or CE)
begin
  if(!I)
    clk_en_af_latch <= CE;
end

reg clk_en ;
[MASKED]
assign O = I && clk_en ;
   
endmodule