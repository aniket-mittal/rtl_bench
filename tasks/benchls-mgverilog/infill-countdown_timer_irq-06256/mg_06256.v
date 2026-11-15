module mg_06256(clk, reset,en, wr, addr,data_in, data_out,wt, irq);
input clk; 
  input reset; 
  input en; 
  input wr; 
  input [3:2] addr; 
  input [31:0] data_in; 
  output reg [31:0] data_out; 
  output wt; 
  output irq; 
  reg [31:0] counter; 
  reg [31:0] divisor; 
  reg divisor_loaded; 
  reg expired; 
  reg alarm; 
  reg ien; 
  always @(posedge clk) begin 
  if (divisor_loaded == 1) begin 
  counter <= divisor; 
  expired <= 0; 
  end else begin 
  if (counter == 32'h00000001) begin 
  counter <= divisor; 
  expired <= 1; 
  end else begin 
  counter <= counter - 1; 
  expired <= 0; 
  end 
  end 
  end 
  [MASKED] 
  always @(*) begin 
  case (addr[3:2]) 
  2'b00: 
  data_out = { 28'h0000000, 2'b00, ien, alarm }; 
  2'b01: 
  data_out = divisor; 
  2'b10: 
  data_out = counter; 
  2'b11: 
  data_out = 32'hxxxxxxxx; 
  default: 
  data_out = 32'hxxxxxxxx; 
  endcase 
  end 
  assign wt = 0; 
  assign irq = ien & alarm; 
 endmodule