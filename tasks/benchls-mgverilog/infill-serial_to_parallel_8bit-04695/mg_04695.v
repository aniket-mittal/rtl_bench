module mg_04695(clk, reset, full, parallel_out, serial_in);
input clk; 
  input reset; 
  output reg full; 
  output [7:0] parallel_out; 
  input serial_in; 
  reg serial_p; 
  reg serial_s; 
  reg [3:0] state; 
  reg [8:0] shift; 
  reg [10:0] count; 
  assign parallel_out[7:0] = shift[7:0]; 
  always @(posedge clk) begin 
  serial_p <= serial_in; 
  serial_s <= serial_p; 
  end 
  [MASKED] 
 endmodule