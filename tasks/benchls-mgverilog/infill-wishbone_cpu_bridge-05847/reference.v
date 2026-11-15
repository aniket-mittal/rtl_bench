module mg_05847 (input cpu_byte_o,input cpu_memop,input cpu_m_io,input [19:0] cpu_adr_o,output reg cpu_block,output reg [15:0] cpu_dat_i,input [15:0] cpu_dat_o,input cpu_we_o,input wb_clk_i,input wb_rst_i,input [15:0] wb_dat_i,output [15:0] wb_dat_o,output reg [19:1] wb_adr_o,output wb_we_o,output wb_tga_o,output reg [ 1:0] wb_sel_o,output reg wb_stb_o,output reg wb_cyc_o,input wb_ack_i);
reg [ 1:0] cs; 
  wire op; 
  wire odd_word; 
  wire a0; 
  wire [15:0] blw; 
  wire [15:0] bhw; 
  wire [19:1] adr1; 
  wire [ 1:0] sel_o; 
  parameter [1:0] 
  cyc0_lo = 3'd0, 
  stb1_hi = 3'd1, 
  stb1_lo = 3'd2, 
  stb2_hi = 3'd3; 
  assign op = (cpu_memop | cpu_m_io); 
  assign odd_word = (cpu_adr_o[0] & !cpu_byte_o); 
  assign a0 = cpu_adr_o[0]; 
  assign blw = { {8{wb_dat_i[7]}}, wb_dat_i[7:0] }; 
  assign bhw = { {8{wb_dat_i[15]}}, wb_dat_i[15:8] }; 
  assign adr1 = a0 ? (cpu_adr_o[19:1] + 1'b1) 
  : cpu_adr_o[19:1]; 
  assign wb_dat_o = a0 ? { cpu_dat_o[7:0], cpu_dat_o[15:8] } 
  : cpu_dat_o; 
  assign wb_we_o = cpu_we_o; 
  assign wb_tga_o = cpu_m_io; 
  assign sel_o = a0 ? 2'b10 : (cpu_byte_o ? 2'b01 : 2'b11); 
  always @(posedge wb_clk_i) 
  cpu_dat_i <= (cs == cyc0_lo) ? 
 (wb_ack_i ?(a0 ? bhw : (cpu_byte_o ? blw : wb_dat_i)): cpu_dat_i) 
 : ((cs == stb1_lo && wb_ack_i) ?{ wb_dat_i[7:0], cpu_dat_i[7:0] }: cpu_dat_i); 
  always @(*) 
  case (cs) 
  default: 
  begin 
  cpu_block <= op; 
  wb_adr_o <= cpu_adr_o[19:1]; 
  wb_sel_o <= sel_o; 
  wb_stb_o <= op; 
  wb_cyc_o <= op; 
  end 
  stb1_hi: 
  begin 
  cpu_block <= odd_word | wb_ack_i; 
  wb_adr_o <= cpu_adr_o[19:1]; 
  wb_sel_o <= sel_o; 
  wb_stb_o <= 1'b0; 
  wb_cyc_o <= odd_word; 
  end 
  stb1_lo: 
  begin 
  cpu_block <= 1'b1; 
  wb_adr_o <= adr1; 
  wb_sel_o <= 2'b01; 
  wb_stb_o <= 1'b1; 
  wb_cyc_o <= 1'b1; 
  end 
  stb2_hi: 
  begin 
  cpu_block <= wb_ack_i; 
  wb_adr_o <= adr1; 
  wb_sel_o <= 2'b01; 
  wb_stb_o <= 1'b0; 
  wb_cyc_o <= 1'b0; 
  end 
  endcase 
  always @(posedge wb_clk_i) 
  if (wb_rst_i) cs <= cyc0_lo; 
  else 
  case (cs) 
  default: cs <= wb_ack_i ? (op ? stb1_hi : cyc0_lo) 
  : cyc0_lo; 
  stb1_hi: cs <= wb_ack_i ? stb1_hi 
  : (odd_word ? stb1_lo : cyc0_lo); 
  stb1_lo: cs <= wb_ack_i ? stb2_hi : stb1_lo; 
  stb2_hi: cs <= wb_ack_i ? stb2_hi : cyc0_lo; 
  endcase 
 endmodule