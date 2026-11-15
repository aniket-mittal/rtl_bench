module mg_04730(rst, clk, ie, de, iaddr, daddr, drw, din, iout, dout, sseg_an, sseg_display);
input rst; 
  input clk; 
  input ie,de; 
  input [31:0] iaddr, daddr; 
  input [1:0] drw; 
  input [31:0] din; 
  output [31:0] iout, dout; 
  output reg [3:0] sseg_an; 
  output [7:0] sseg_display; 
  wire [31:0] idata, ddata; 
  assign iout = idata; 
  assign dout = ddata; 
  reg [31:0] sseg; 
  assign idata = 32'h00000000; 
  assign ddata = sseg; 
  parameter CLOCK_FREQ = 25000000; 
  parameter TICKS = CLOCK_FREQ/240; 
  reg [31:0] counter; 
  assign sseg_display = sseg_an == 4'b1110 ? sseg[7:0] : 
  sseg_an == 4'b1101 ? sseg[15:8] : 
  sseg_an == 4'b1011 ? sseg[23:16] : 
  sseg_an == 4'b0111 ? sseg[31:24] : sseg[7:0]; 
  always @(negedge clk) begin 
  if (drw[0] && de && !rst) begin 
  sseg = din; 
  end else if (rst) begin 
  sseg = 32'h00000000; 
  counter = 0; 
  end 
  counter = counter + 1; 
  if (counter == TICKS) begin 
  counter = 0; 
  sseg_an = sseg_an == 4'b1110 ? 4'b1101 : 
  sseg_an == 4'b1101 ? 4'b1011 : 
  sseg_an == 4'b1011 ? 4'b0111 : 
  sseg_an == 4'b0111 ? 4'b1110 : 4'b1110; 
  end 
  end 
 endmodule