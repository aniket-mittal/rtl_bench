module mg_06914 (input cpu_byte_o,input cpu_memop,input cpu_m_io,input [19:0] cpu_adr_o,output reg cpu_block,output reg [15:0] cpu_dat_i,input [15:0] cpu_dat_o,input cpu_we_o,input wb_clk_i,input wb_rst_i,input [15:0] wb_dat_i,output reg [15:0] wb_dat_o,output reg [19:1] wb_adr_o,output wb_we_o,output wb_tga_o,output reg [ 1:0] wb_sel_o,output reg wb_stb_o,output wb_cyc_o,input wb_ack_i);
reg [ 1:0] cs; 
  reg [ 1:0] ns; 
  reg [19:1] adr1; 
  wire op; 
  wire odd_word; 
  wire a0; 
  wire [15:0] blw; 
  wire [15:0] bhw; 
  wire [ 1:0] sel_o; 
  localparam [1:0] 
  IDLE = 2'd0, 
  stb1_hi = 2'd1, 
  stb2_hi = 2'd2, 
  bloc_lo = 2'd3; 
  assign op = (cpu_memop | cpu_m_io); 
  assign odd_word = (cpu_adr_o[0] & !cpu_byte_o); 
  assign a0 = cpu_adr_o[0]; 
  assign blw = { {8{wb_dat_i[7]}}, wb_dat_i[7:0] }; 
  assign bhw = { {8{wb_dat_i[15]}}, wb_dat_i[15:8] }; 
  assign wb_we_o = cpu_we_o; 
  assign wb_tga_o = cpu_m_io; 
  assign sel_o = a0 ? 2'b10 : (cpu_byte_o ? 2'b01 : 2'b11); 
  assign wb_cyc_o = wb_stb_o; 
  always @(posedge wb_clk_i) 
 cpu_dat_i <= (cs == stb1_hi) ? (wb_ack_i ? (a0 ? bhw : (cpu_byte_o ? blw : wb_dat_i)): cpu_dat_i) : ((cs == stb2_hi && wb_ack_i) ? { wb_dat_i[7:0], cpu_dat_i[7:0] } : cpu_dat_i); 
  always @(posedge wb_clk_i) adr1 <= cpu_adr_o[19:1] + 1'b1; 
  always @(posedge wb_clk_i) wb_adr_o <= (ns==stb2_hi) ? adr1 : cpu_adr_o[19:1]; 
  always @(posedge wb_clk_i) wb_sel_o <= (ns==stb1_hi) ? sel_o : 2'b01; 
  always @(posedge wb_clk_i) wb_stb_o <= (ns==stb1_hi || ns==stb2_hi); 
  always @(posedge wb_clk_i) wb_dat_o <= a0 ? { cpu_dat_o[7:0], cpu_dat_o[15:8] } : cpu_dat_o; 
  always @(*) 
  case (cs) 
  IDLE: cpu_block <= op; 
  default: cpu_block <= 1'b1; 
  bloc_lo: cpu_block <= wb_ack_i; 
  endcase 
  always @(posedge wb_clk_i) cs <= wb_rst_i ? IDLE : ns; 
  always @(*) 
  case (cs) 
  default: ns <= wb_ack_i ? IDLE : (op ? stb1_hi : IDLE); 
  stb1_hi: ns <= wb_ack_i ? (odd_word ? stb2_hi : bloc_lo) : stb1_hi; 
  stb2_hi: ns <= wb_ack_i ? bloc_lo : stb2_hi; 
  bloc_lo: ns <= wb_ack_i ? bloc_lo : IDLE; 
  endcase 
 endmodule