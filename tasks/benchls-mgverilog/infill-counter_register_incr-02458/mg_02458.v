module mg_02458(clk, rst, we, incr, wr, rd);
parameter width = 'd16; 
  parameter add_width = 'd13; 
  input wire clk , rst ; 
  input wire we , incr ; 
  input wire [width-1:0] wr ; 
  output wire [add_width-1:0] rd ; 
  reg [width-1:0] mem ; 
  assign rd [add_width-1:0] = mem [add_width-1:0]; 
  [MASKED] 
 endmodule