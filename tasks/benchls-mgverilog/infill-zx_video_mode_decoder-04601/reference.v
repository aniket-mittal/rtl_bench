module mg_04601(input wire clk,input wire [ 1:0] pent_vmode,input wire [ 2:0] atm_vmode,output reg mode_atm_n_pent,output reg mode_zx,output reg mode_p_16c,output reg mode_p_hmclr,output reg mode_a_hmclr,output reg mode_a_16c,output reg mode_a_text,output reg mode_a_txt_1page,output reg mode_pixf_14,output reg [ 1:0] mode_bw);
always @(posedge clk) 
  begin 
  case( atm_vmode ) 
  3'b010: mode_atm_n_pent <= 1'b1; 
  3'b000: mode_atm_n_pent <= 1'b1; 
  3'b110: mode_atm_n_pent <= 1'b1; 
  3'b111: mode_atm_n_pent <= 1'b1; 
  3'b011: mode_atm_n_pent <= 1'b0; 
  default: mode_atm_n_pent <= 1'b0; 
  endcase 
  case( atm_vmode ) 
  3'b010: mode_zx <= 1'b0; 
  3'b000: mode_zx <= 1'b0; 
  3'b110: mode_zx <= 1'b0; 
  3'b111: mode_zx <= 1'b0; 
  default: begin 
  if( (pent_vmode==2'b00) || (pent_vmode==2'b11) ) 
  mode_zx <= 1'b1; 
  else 
  mode_zx <= 1'b0; 
  end 
  endcase 
  if( (atm_vmode==3'b011) && (pent_vmode==2'b10) ) 
  mode_p_16c <= 1'b1; 
  else 
  mode_p_16c <= 1'b0; 
  if( (atm_vmode==3'b011) && (pent_vmode==2'b01) ) 
  mode_p_hmclr <= 1'b1; 
  else 
  mode_p_hmclr <= 1'b0; 
  if( atm_vmode==3'b010 ) 
  mode_a_hmclr <= 1'b1; 
  else 
  mode_a_hmclr <= 1'b0; 
  if( atm_vmode==3'b000 ) 
  mode_a_16c <= 1'b1; 
  else 
  mode_a_16c <= 1'b0; 
  if( (atm_vmode==3'b110) || (atm_vmode==3'b111) ) 
  mode_a_text <= 1'b1; 
  else 
  mode_a_text <= 1'b0; 
  if( atm_vmode==3'b111 ) 
  mode_a_txt_1page <= 1'b1; 
  else 
  mode_a_txt_1page <= 1'b0; 
  if( (atm_vmode==3'b010) || (atm_vmode==3'b110) || (atm_vmode==3'b111) ) 
  mode_pixf_14 <= 1'b1; 
  else 
  mode_pixf_14 <= 1'b0; 
  if( (atm_vmode==3'b011) && (pent_vmode!=2'b10) ) 
  mode_bw <= 2'b00; 
  else 
  mode_bw <= 2'b01; 
  end 
 endmodule