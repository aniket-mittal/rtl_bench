module register(clock, resetn, d, q);
  input clock;
  input resetn;
  input [7:0] d;
  output [7:0] q;
  reg [7:0] q;

  always @(posedge clock) 
  begin
    if (resetn == 1'b0)     
      q <= 0;
    else                    
      q <= d;
  end
endmodule