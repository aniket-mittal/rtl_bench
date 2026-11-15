module mg_00816 (input wire clk_i,input wire reset_i,input wire [3:0] A_i,input wire [7:0] D_i,output reg [7:0] D_o,input wire rd_i,input wire wr_i,output reg [31:0] adr_o,output reg [31:0] dat_o,output reg we_o,output reg [3:0] sel_o,output reg stb_o,output reg cyc_o,input wire [31:0] dat_i,input wire ack_i);
wire rd_rise, wr_rise; 
  reg [1:0] track_rd, track_wr; 
  reg [31:0] dat_store; 
  reg busy; 
  assign rd_rise = (track_rd == 2'b01); 
  assign wr_rise = (track_wr == 2'b01); 
  always @(posedge clk_i) track_rd <= {track_rd[0],rd_i}; 
  always @(posedge clk_i) track_wr <= {track_wr[0],wr_i}; 
  always @(posedge clk_i or posedge reset_i) 
  if( reset_i ) 
  begin 
  adr_o <= 32'd0; 
  dat_o <= 32'd0; 
  we_o <= 1'b0; 
  sel_o <= 4'd0; 
  stb_o <= 1'b0; 
  cyc_o <= 1'b0; 
  end else begin 
  if( wr_rise ) 
  begin 
  case( A_i[3:2] ) 
  2'b00: 
  begin 
  case( A_i[1:0] ) 
  2'b00: dat_o[7:0] <= D_i; 
  2'b01: dat_o[15:8] <= D_i; 
  2'b10: dat_o[23:16] <= D_i; 
  2'b11: dat_o[31:24] <= D_i; 
  endcase 
  end 
  2'b01: 
  begin 
  case( A_i[1:0] ) 
  2'b00: adr_o[7:0] <= D_i; 
  2'b01: adr_o[15:8] <= D_i; 
  2'b10: adr_o[23:16] <= D_i; 
  2'b11: adr_o[31:24] <= D_i; 
  endcase 
  end 
  2'b10,2'b11: 
  if( D_i[7] ) begin 
  sel_o <= D_i[5:2]; 
  we_o <= D_i[6]; 
  stb_o <= 1'b1; 
  cyc_o <= 1'b1; 
  end 
  endcase 
  end 
  else begin 
  if( rd_rise ) 
  begin 
  case( A_i[3:2] ) 
  2'b00: 
  begin 
  case( A_i[1:0] ) 
  2'b00: D_o <= dat_store[7:0]; 
  2'b01: D_o <= dat_store[15:8]; 
  2'b10: D_o <= dat_store[23:16]; 
  2'b11: D_o <= dat_store[31:24]; 
  endcase 
  end 
  2'b01: 
  begin 
  case( A_i[1:0] ) 
  2'b00: D_o <= adr_o[7:0]; 
  2'b01: D_o <= adr_o[15:8]; 
  2'b10: D_o <= adr_o[23:16]; 
  2'b11: D_o <= adr_o[31:24]; 
  endcase 
  end 
  2'b10,2'b11: 
  D_o <= {1'b0, we_o, sel_o, 1'b0, busy}; 
  endcase 
  end 
  else if( ack_i ) begin 
  stb_o <= 1'b0; 
  cyc_o <= 1'b0; 
  end 
  end 
  end 
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