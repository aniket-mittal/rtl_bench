module mg_07816 (input wire clk,input wire clk7_en,output wire dma,input wire [ 4-1:0] audio_dmal,input wire [ 4-1:0] audio_dmas,input wire [ 9-1:0] hpos,input wire [ 9-1:1] reg_address_in,output reg [ 9-1:1] reg_address_out,input wire [ 16-1:0] data_in,output wire [ 21-1:1] address_out);
parameter AUD0DAT_REG = 9'h0AA; 
 parameter AUD1DAT_REG = 9'h0BA; 
 parameter AUD2DAT_REG = 9'h0CA; 
 parameter AUD3DAT_REG = 9'h0DA; 
 wire audlcena; 
 wire [ 1: 0] audlcsel; 
 reg [ 20:16] audlch [3:0]; 
 reg [ 15: 1] audlcl [3:0]; 
 wire [ 20: 1] audlcout; 
 reg [ 20: 1] audpt [3:0]; 
 wire [ 20: 1] audptout; 
 reg [ 1: 0] channel; 
 reg dmal; 
 reg dmas; 
 assign audlcena = ~reg_address_in[8] & reg_address_in[7] & (reg_address_in[6]^reg_address_in[5]) & ~reg_address_in[3] & ~reg_address_in[2]; 
 assign audlcsel = {~reg_address_in[5],reg_address_in[4]}; 
 always @ (posedge clk) begin 
  if (clk7_en) begin 
  if (audlcena & ~reg_address_in[1]) 
  audlch[audlcsel] <= #1 data_in[4:0]; 
  end 
 end 
 always @ (posedge clk) begin 
  if (clk7_en) begin 
  if (audlcena & reg_address_in[1]) 
  audlcl[audlcsel] <= #1 data_in[15:1]; 
  end 
 end 
 assign audlcout = {audlch[channel],audlcl[channel]}; 
 always @ (*) begin 
  case (hpos) 
  9'b0001_0010_1 : dmal = audio_dmal[0]; 
  9'b0001_0100_1 : dmal = audio_dmal[1]; 
  9'b0001_0110_1 : dmal = audio_dmal[2]; 
  9'b0001_1000_1 : dmal = audio_dmal[3]; 
  default : dmal = 0; 
  endcase 
 end 
 assign dma = dmal; 
 always @ (*) begin 
  case (hpos) 
  9'b0001_0010_1 : dmas = audio_dmas[0]; 
  9'b0001_0100_1 : dmas = audio_dmas[1]; 
  9'b0001_0110_1 : dmas = audio_dmas[2]; 
  9'b0001_1000_1 : dmas = audio_dmas[3]; 
  default : dmas = 0; 
  endcase 
 end 
 always @ (*) begin 
  case (hpos[3:2]) 
  2'b01 : channel = 0; 
  2'b10 : channel = 1; 
  2'b11 : channel = 2; 
  2'b00 : channel = 3; 
  endcase 
 end 
 assign address_out[20:1] = audptout[20:1]; 
 always @ (posedge clk) begin 
  if (clk7_en) begin 
  if (dmal) 
  audpt[channel] <= #1 dmas ? audlcout[20:1] : audptout[20:1] + 1'b1; 
  end 
 end 
 assign audptout[20:1] = audpt[channel]; 
 always @ (*) begin 
  case (channel) 
  0 : reg_address_out[8:1] = AUD0DAT_REG[8:1]; 
  1 : reg_address_out[8:1] = AUD1DAT_REG[8:1]; 
  2 : reg_address_out[8:1] = AUD2DAT_REG[8:1]; 
  3 : reg_address_out[8:1] = AUD3DAT_REG[8:1]; 
  endcase 
 end 
 endmodule