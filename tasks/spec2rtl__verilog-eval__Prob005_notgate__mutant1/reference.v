module dut
(
  input in,
  output out
);

  reg out_r;

  always @(in) begin
    if(in) out_r = 1'b0; 
  end

  assign out = out_r;

endmodule
