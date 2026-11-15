module mg_01880(input clk, input ce, input reset,input [31:0] flags,input [15:0] prg_ain, output [21:0] prg_aout,input prg_read, prg_write,input [7:0] prg_din,output prg_allow,input [13:0] chr_ain, output [21:0] chr_aout,output chr_allow,output vram_a10,output vram_ce);
reg [4:0] shift; 
  reg [4:0] control; 
  reg [4:0] chr_bank_0; 
  reg [4:0] chr_bank_1; 
  reg [4:0] prg_bank; 
  always @(posedge clk) if (reset) begin 
  shift <= 1; 
  control <= 'hC; 
  end else if (ce) begin 
  if (prg_write && prg_ain[15]) begin 
  if (prg_din[7]) begin 
  shift <= 5'b10000; 
  control <= control | 'hC; 
  end else begin 
  if (shift[0]) begin 
  casez(prg_ain[14:13]) 
  0: control <= {prg_din[0], shift[4:1]}; 
  1: chr_bank_0 <= {prg_din[0], shift[4:1]}; 
  2: chr_bank_1 <= {prg_din[0], shift[4:1]}; 
  3: prg_bank <= {prg_din[0], shift[4:1]}; 
  endcase 
  shift <= 5'b10000; 
  end else begin 
  shift <= {prg_din[0], shift[4:1]}; 
  end 
  end 
  end 
  end 
  reg [3:0] prgsel; 
  always @* begin 
  casez({control[3:2], prg_ain[14]}) 
  3'b0?_?: prgsel = {prg_bank[3:1], prg_ain[14]}; 
  3'b10_0: prgsel = 4'b0000; 
  3'b10_1: prgsel = prg_bank[3:0]; 
  3'b11_0: prgsel = prg_bank[3:0]; 
  3'b11_1: prgsel = 4'b1111; 
  endcase 
  end 
  wire [21:0] prg_aout_tmp = {4'b00_00, prgsel, prg_ain[13:0]}; 
  reg [4:0] chrsel; 
  always @* begin 
  casez({control[4], chr_ain[12]}) 
  2'b0_?: chrsel = {chr_bank_0[4:1], chr_ain[12]}; 
  2'b1_0: chrsel = chr_bank_0; 
  2'b1_1: chrsel = chr_bank_1; 
  endcase 
  end 
  assign chr_aout = {5'b100_00, chrsel, chr_ain[11:0]}; 
  reg vram_a10_t; 
  always @* begin 
  casez(control[1:0]) 
  2'b00: vram_a10_t = 0; 
  2'b01: vram_a10_t = 1; 
  2'b10: vram_a10_t = chr_ain[10]; 
  2'b11: vram_a10_t = chr_ain[11]; 
  endcase 
  end 
  assign vram_a10 = vram_a10_t; 
  assign vram_ce = chr_ain[13]; 
  wire prg_is_ram = prg_ain >= 'h6000 && prg_ain < 'h8000; 
  assign prg_allow = prg_ain[15] && !prg_write || prg_is_ram; 
  wire [21:0] prg_ram = {9'b11_1100_000, prg_ain[12:0]}; 
  assign prg_aout = prg_is_ram ? prg_ram : prg_aout_tmp; 
  assign chr_allow = flags[15]; 
 endmodule