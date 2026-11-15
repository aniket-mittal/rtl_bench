module mg_01243(reset, uidbitclk, uidbitout, uidbitdone,uid_byte_in, uid_addr_out, uid_clk_out);
input reset, uidbitclk; 
 output uidbitout, uidbitdone, uid_clk_out; 
 input [7:0] uid_byte_in; 
 output [3:0] uid_addr_out; 
 wire [15:0] preamble; 
 assign preamble = 16'h3000; 
 reg [3:0] bitoutcounter; 
 reg [3:0] uid_addr_out; 
 reg initialized; 
 reg preambledone; 
 assign uidbitout = (!preambledone) ? preamble[bitoutcounter] : uid_byte_in[bitoutcounter[2:0]]; 
 assign uidbitdone = (bitoutcounter == 4'd0 && uid_addr_out == 11); 
 assign uid_clk_out = ~uidbitclk; 
 always @ (posedge uidbitclk or posedge reset) begin 
  if (reset) begin 
  bitoutcounter <= 4'd0; 
  initialized <= 0; 
  preambledone <= 0; 
  uid_addr_out <= 4'd0; 
  end else if (!initialized) begin 
  initialized <= 1; 
  bitoutcounter <= 4'd15; 
  end else if (!preambledone) begin 
  if (bitoutcounter == 0) begin 
  preambledone <= 1; 
  bitoutcounter <= 4'd7; 
  end else begin 
  bitoutcounter <= bitoutcounter - 4'd1; 
  end 
  end else if (!uidbitdone) begin 
  if (bitoutcounter == 0) begin 
  uid_addr_out <= uid_addr_out + 4'd1; 
  bitoutcounter <= 4'd7; 
  end else begin 
  bitoutcounter <= bitoutcounter - 4'd1; 
  end 
  end else begin 
  end 
 end 
 endmodule