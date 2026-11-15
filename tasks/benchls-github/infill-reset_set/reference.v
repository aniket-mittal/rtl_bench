module reset_set(
  input clk,
  input nrst,
  input s,
  input r,
  output logic q = 0,   // aka "present state"
  output nq
);

always_ff @(posedge clk) begin
  if( ~nrst ) begin
    q = 0;
  end else begin
    if( r ) q = 1'b0;
    if( s ) q = 1'b1;
  end
end

assign nq = ~q;

endmodule