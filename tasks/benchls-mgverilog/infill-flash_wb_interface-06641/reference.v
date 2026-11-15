module mg_06641 (input wb_clk_i,input wb_rst_i,input [15:0] wb_dat_i,output reg [15:0] wb_dat_o,input wb_we_i,input wb_adr_i,input [ 1:0] wb_sel_i,input wb_stb_i,input wb_cyc_i,output reg wb_ack_o,output reg [22:0] flash_addr_,input [ 7:0] flash_data_,output flash_we_n_,output reg flash_oe_n_,output reg flash_ce_n_,output flash_rst_n_);
wire op; 
  wire wr_command; 
  wire flash_addr0; 
  reg [21:0] address; 
  wire word; 
  wire op_word; 
  reg [ 3:0] st; 
  reg [ 7:0] lb; 
  assign op = wb_stb_i & wb_cyc_i; 
  assign word = wb_sel_i==2'b11; 
  assign op_word = op & word & !wb_we_i; 
  assign flash_rst_n_ = 1'b1; 
  assign flash_we_n_ = 1'b1; 
  assign flash_addr0 = (wb_sel_i==2'b10) | (word & |st[2:1]); 
  assign wr_command = op & wb_we_i; 
  always @(posedge wb_clk_i) 
  flash_addr_ <= { address, flash_addr0 }; 
  always @(posedge wb_clk_i) 
  flash_oe_n_ <= !(op & !wb_we_i); 
  always @(posedge wb_clk_i) 
  flash_ce_n_ <= !(op & !wb_we_i); 
  always @(posedge wb_clk_i) 
  wb_dat_o <= wb_rst_i ? 16'h0 
 : (st[2] ? (wb_sel_i[1] ? { flash_data_, lb }: { 8'h0, flash_data_ }): wb_dat_o); 
  always @(posedge wb_clk_i) 
  wb_ack_o <= wb_rst_i ? 1'b0 
  : (wb_ack_o ? 1'b0 : (op & (wb_we_i ? 1'b1 : st[2]))); 
  always @(posedge wb_clk_i) 
  st <= wb_rst_i ? 4'h0 
 : (op & st==4'h0 ? (word ? 4'b0001 : 4'b0100): { st[2:0], 1'b0 }); 
  always @(posedge wb_clk_i) 
  lb <= wb_rst_i ? 8'h0 : (op_word & st[1] ? flash_data_ : 8'h0); 
  `define FLASH_ALO 1'h0 
  `define FLASH_AHI 1'h1 
  always @(posedge wb_clk_i) 
  if(wb_rst_i) 
  address <= 22'h000000; 
  else 
  if(wr_command) 
  case(wb_adr_i) 
  `FLASH_ALO: address[15: 0] <= wb_dat_i; 
  `FLASH_AHI: address[21:16] <= wb_dat_i[5:0]; 
  default: ; 
  endcase 
 endmodule