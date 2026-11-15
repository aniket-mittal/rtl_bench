module mg_09883(input wire clk,input wire [1:0] modes_raster,output reg vga_hsync,output reg scanout_start,input wire hsync_start);
localparam HSYNC_END = 10'd106; 
  localparam SCANOUT_BEG = 10'd156; 
  localparam HPERIOD_224 = 10'd896; 
  localparam HPERIOD_228 = 10'd912; 
  reg [9:0] hcount; 
  initial 
  begin 
  hcount = 9'd0; 
  vga_hsync = 1'b0; 
  end 
  always @(posedge clk) 
  begin 
  if( hsync_start ) 
  hcount <= 10'd2; 
  else if ( hcount==( (modes_raster==2'b11) ? (HPERIOD_228-10'd1) : (HPERIOD_224-10'd1) ) ) 
  hcount <= 10'd0; 
  else 
  hcount <= hcount + 9'd1; 
  end 
  always @(posedge clk) 
  begin 
  if( !hcount ) 
  vga_hsync <= 1'b1; 
  else if( hcount==HSYNC_END ) 
  vga_hsync <= 1'b0; 
  end 
  always @(posedge clk) 
  begin 
  if( hcount==SCANOUT_BEG ) 
  scanout_start <= 1'b1; 
  else 
  scanout_start <= 1'b0; 
  end 
 endmodule