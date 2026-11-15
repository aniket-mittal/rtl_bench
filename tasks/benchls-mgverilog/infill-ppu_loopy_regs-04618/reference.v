module mg_04618(input clk, input ce,input is_rendering,input [2:0] ain,input [7:0] din,input read,input write,input is_pre_render,input [8:0] cycle,output [14:0] loopy,output [2:0] fine_x_scroll);
reg ppu_incr; 
  reg [14:0] loopy_v; 
  reg [14:0] loopy_t; 
  reg [2:0] loopy_x; 
  reg ppu_address_latch; 
  initial begin 
  ppu_incr = 0; 
  loopy_v = 0; 
  loopy_t = 0; 
  loopy_x = 0; 
  ppu_address_latch = 0; 
  end 
  always @(posedge clk) if (ce) begin 
  if (is_rendering) begin 
  if (cycle[2:0] == 3 && (cycle < 256 || cycle >= 320 && cycle < 336)) begin 
  loopy_v[4:0] <= loopy_v[4:0] + 1; 
  loopy_v[10] <= loopy_v[10] ^ (loopy_v[4:0] == 31); 
  end 
  if (cycle == 251) begin 
  loopy_v[14:12] <= loopy_v[14:12] + 1; 
  if (loopy_v[14:12] == 7) begin 
  if (loopy_v[9:5] == 29) begin 
  loopy_v[9:5] <= 0; 
  loopy_v[11] <= !loopy_v[11]; 
  end else begin 
  loopy_v[9:5] <= loopy_v[9:5] + 1; 
  end 
  end 
  end 
  if (cycle == 256) 
  {loopy_v[10], loopy_v[4:0]} <= {loopy_t[10], loopy_t[4:0]}; 
  if (cycle == 304 && is_pre_render) begin 
  loopy_v <= loopy_t; 
  end 
  end 
  if (write && ain == 0) begin 
  loopy_t[10] <= din[0]; 
  loopy_t[11] <= din[1]; 
  ppu_incr <= din[2]; 
  end else if (write && ain == 5) begin 
  if (!ppu_address_latch) begin 
  loopy_t[4:0] <= din[7:3]; 
  loopy_x <= din[2:0]; 
  end else begin 
  loopy_t[9:5] <= din[7:3]; 
  loopy_t[14:12] <= din[2:0]; 
  end 
  ppu_address_latch <= !ppu_address_latch; 
  end else if (write && ain == 6) begin 
  if (!ppu_address_latch) begin 
  loopy_t[13:8] <= din[5:0]; 
  loopy_t[14] <= 0; 
  end else begin 
  loopy_t[7:0] <= din; 
  loopy_v <= {loopy_t[14:8], din}; 
  end 
  ppu_address_latch <= !ppu_address_latch; 
  end else if (read && ain == 2) begin 
  ppu_address_latch <= 0; 
  end else if ((read || write) && ain == 7 && !is_rendering) begin 
  loopy_v <= loopy_v + (ppu_incr ? 32 : 1); 
  end 
  end 
  assign loopy = loopy_v; 
  assign fine_x_scroll = loopy_x; 
 endmodule