module mg_00816 (input wire clk_i,input wire reset_i,input wire [3:0] A_i,input wire [7:0] D_i,output reg [7:0] D_o,input wire rd_i,input wire wr_i,output reg [31:0] adr_o,output reg [31:0] dat_o,output reg we_o,output reg [3:0] sel_o,output reg stb_o,output reg cyc_o,input wire [31:0] dat_i,input wire ack_i);
wire rd_rise, wr_rise; 
  reg [1:0] track_rd, track_wr; 
  reg [31:0] dat_store; 
  reg busy; 
  assign rd_rise = (track_rd == 2'b01); 
  assign wr_rise = (track_wr == 2'b01); 
  always @(posedge clk_i) track_rd <= {track_rd[0],rd_i}; 
  always @(posedge clk_i) track_wr <= {track_wr[0],wr_i}; 
  [MASKED] 
  always @(posedge clk_i or posedge reset_i) 
  if( reset_i ) begin 
  dat_store <= 32'd0; 
  busy <= 1'b0; 
  end 
  else begin 
  if( ack_i ) begin 
  dat_store <= dat_i; 
  busy <= 1'b0; 
  end 
  else 
  if( wr_rise & A_i[3] & D_i[7] ) busy <= 1'b1; 
  end 
 endmodule