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
always @ (clk_en_af_latch )
begin
    clk_en <= clk_en_af_latch;
end
assign O = I && clk_en ;
   
endmodule