module mg_02197(data_out, empty, full, data_in, push, pop, reset, clk);
parameter DEPTH = 8; 
  parameter WIDTH = 8; 
  output [WIDTH-1:0] data_out; 
  output empty; 
  output full; 
  input [WIDTH-1:0] data_in; 
  input push; 
  input pop; 
  input reset; 
  input clk; 
  reg [WIDTH-1:0] data_out; 
  reg empty,full; 
  reg [DEPTH-1:0] wraddr, rdaddr; 
  reg [DEPTH-1:0] reg_file [WIDTH-1:0]; 
  reg [DEPTH-1:0] num_elems; 
  always @(reset) 
  begin 
  data_out=8'd0; 
  empty=1'd0; 
  full=1'd0; 
  wraddr=8'd0; 
  rdaddr=8'd0; 
  num_elems=8'd0; 
  end 
  [MASKED] 
 endmodule