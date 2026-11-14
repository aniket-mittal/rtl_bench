module dut
(
  input clk,
  input areset,
  input load,
  input ena,
  input [3:0] data,
  output reg [3:0] q
);


  always @(posedge clk or posedge areset) begin
    if(areset) q <= 0; 
    else if(load) q <= { data[0], data[1], data[2], data[3] }; 
    else if(ena) q <= q[3:1]; 
  end


endmodule
