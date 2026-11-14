module dut
(
  input clk,
  input d,
  output reg q
);

  reg qp;
  reg qn;

  always @(posedge clk) qp <= d;


  always @(negedge clk) qn <= d;


  always @(*) if(clk) q <= qp; 


endmodule
