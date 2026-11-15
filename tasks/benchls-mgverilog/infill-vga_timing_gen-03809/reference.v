module mg_03809(vga_clk,rst,addr,v_active,h_sync,v_sync);
input vga_clk; 
  input rst; 
  output [18: 0] addr; 
  output v_active; 
  output h_sync, v_sync; 
  reg [9:0] h_count = 0; 
  always @ (posedge vga_clk or posedge rst) begin 
  if (rst) begin 
  h_count <= 10'h0; 
  end else if (h_count == 10'd799) begin 
  h_count <= 10'h0; 
  end else begin 
  h_count <= h_count + 10'h1; 
  end 
  end 
  reg [9:0] v_count = 0; 
  always @ (posedge vga_clk or posedge rst) begin 
  if (rst) begin 
  v_count <= 10'h0; 
  end else if (h_count == 10'd799) begin 
  if (v_count == 10'd524) begin 
  v_count <= 10'h0; 
  end else begin 
  v_count <= v_count + 10'h1; 
  end 
  end 
  end 
  wire h_sync = (h_count > 10'd95); 
  wire v_sync = (v_count > 10'd1); 
  wire v_active = (h_count > 10'd142) && 
  (h_count < 10'd783) && 
  (v_count > 10'd34) && 
  (v_count < 10'd515); 
  wire [ 9: 0] col = h_count - 10'd143; 
  wire [ 9: 0] row = v_count - 10'd35; 
  wire [18: 0] addr = {row[ 8: 0], col}; 
 endmodule