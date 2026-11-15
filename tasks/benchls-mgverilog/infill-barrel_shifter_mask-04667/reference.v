module mg_04667 ( MASKE,ROT,LSH,ASH,SIZE,SH_VAL,SH_DAT,SH_OUT,MASK_SEL);
input [31:0] MASKE; 
  input ROT,LSH,ASH; 
  input [1:0] SIZE; 
  input [7:0] SH_VAL; 
  input [31:0] SH_DAT; 
  output [31:0] SH_OUT; 
  output [4:0] MASK_SEL; 
  reg [31:0] sh_dat_in; 
  wire [31:0] sh_dat_0,sh_dat_1,sh_dat_2,sh_dat_3,sh_dat_4; 
  wire [4:0] shift; 
  reg msb; 
  wire [1:0] mask_code; 
  reg [31:0] SH_OUT; 
  reg [4:0] MASK_SEL; 
  always @(ROT or SIZE or SH_DAT) 
  casex ({ROT,SIZE}) 
  3'b100 : sh_dat_in = {SH_DAT[31:16],SH_DAT[7:0],SH_DAT[7:0]}; 
  3'b101 : sh_dat_in = {SH_DAT[15:0],SH_DAT[15:0]}; 
  default : sh_dat_in = SH_DAT; 
  endcase 
  assign shift = (ROT & (SIZE == 2'b00)) ? {2'b11,SH_VAL[2:0]} : SH_VAL[4:0]; 
  assign sh_dat_0 = shift[0] ? {sh_dat_in[30:0],sh_dat_in[31]} : sh_dat_in; 
  assign sh_dat_1 = shift[1] ? {sh_dat_0[29:0],sh_dat_0[31:30]} : sh_dat_0; 
  assign sh_dat_2 = shift[2] ? {sh_dat_1[27:0],sh_dat_1[31:28]} : sh_dat_1; 
  assign sh_dat_3 = shift[3] ? {sh_dat_2[23:0],sh_dat_2[31:24]} : sh_dat_2; 
  assign sh_dat_4 = shift[4] ? {sh_dat_3[15:0],sh_dat_3[31:16]} : sh_dat_3; 
  always @(SIZE or SH_DAT) 
  casex (SIZE) 
  2'b00 : msb = SH_DAT[7]; 
  2'b01 : msb = SH_DAT[15]; 
  default : msb = SH_DAT[31]; 
  endcase 
  assign mask_code[1] = ROT | (SH_VAL[7] & ASH & msb); 
  assign mask_code[0] = ROT | (SH_VAL[7] & ((ASH & ~msb) | LSH)); 
  always @(SH_VAL or SIZE) 
  casex ({SH_VAL[7],SIZE}) 
  3'b100 : MASK_SEL = {2'b00,SH_VAL[2:0]}; 
  3'b101 : MASK_SEL = {1'b0,SH_VAL[3:0]}; 
  default : MASK_SEL = SH_VAL[4:0]; 
  endcase 
  always @(mask_code or sh_dat_4 or MASKE) 
  casex (mask_code) 
  2'b00 : SH_OUT = sh_dat_4 & MASKE; 
  2'b01 : SH_OUT = sh_dat_4 & ~MASKE; 
  2'b10 : SH_OUT = sh_dat_4 | MASKE; 
  default : SH_OUT = sh_dat_4; 
  endcase 
 endmodule