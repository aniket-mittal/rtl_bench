module mg_02886 (rx_clk,rx_sof,rx_eof,rx_ferr,rx_fdata,rx_err,rx_data);
input rx_clk; 
  input [ 3:0] rx_sof; 
  input [ 3:0] rx_eof; 
  input [ 3:0] rx_ferr; 
  input [31:0] rx_fdata; 
  output rx_err; 
  output [31:0] rx_data; 
  reg rx_err = 'd0; 
  reg [31:0] rx_data = 'd0; 
  wire rx_err_s; 
  assign rx_err_s = ((rx_sof == rx_eof) && (rx_ferr == 4'd0)) ? 1'b0 : 1'b1; 
  always @(posedge rx_clk) begin 
  case (rx_sof) 
  4'b1111: begin 
  rx_err <= rx_err_s; 
  rx_data <= rx_fdata; 
  end 
  default: begin 
  rx_err <= 1'b1; 
  rx_data <= 32'hffff; 
  end 
  endcase 
  end 
 endmodule