module dut
(
  input clk,
  input a,
  output reg q
);


  always @(posedge clk or posedge a) begin
    if(a) q <= 1'b0; 
    else q <= ~a;
  end


endmodule
