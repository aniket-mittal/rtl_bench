module rtlpp_07945 (input in, clock, load, output out);
  reg q;
  assign out = q;
  always @(posedge clock) begin
	  if (load) q = in;
  end
endmodule