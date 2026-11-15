module mg_10605 (clock,reset_n,avmm_read,avmm_write,avmm_addr,avmm_writedata,avmm_readdata,csr_status,csr_control);
parameter AVMM_CSR_DATA_WIDTH = 32; 
  localparam [1:0] ERASE_ST_IDLE = 0, 
  ERASE_ST_PENDING = 1, 
  ERASE_ST_BUSY = 2; 
  localparam [1:0] STATUS_IDLE = 0, 
  STATUS_BUSY_ERASE = 1, 
  STATUS_BUSY_WRITE = 2, 
  STATUS_BUSY_READ = 3; 
  input clock; 
  input reset_n; 
  input avmm_read; 
  input avmm_write; 
  input avmm_addr; 
  input [AVMM_CSR_DATA_WIDTH-1:0] avmm_writedata; 
  output [AVMM_CSR_DATA_WIDTH-1:0] avmm_readdata; 
  input [9:0] csr_status; 
  output [31:0] csr_control; 
  reg [22:0] csr_sector_page_erase_addr_reg; 
  reg [4:0] csr_wp_mode; 
  reg [1:0] csr_erase_state; 
  reg csr_control_access; 
  reg reset_n_reg1; 
  reg reset_n_reg2; 
  wire reset_n_w; 
  wire is_idle; 
  wire is_erase_busy; 
  wire valid_csr_erase_addr; 
  wire valid_csr_write; 
  wire [31:0] csr_control_signal; 
  wire [22:0] csr_erase_addr; 
  assign is_idle = (csr_status[1:0] == STATUS_IDLE); 
  assign is_erase_busy = (csr_status[1:0] == STATUS_BUSY_ERASE); 
  assign csr_erase_addr = avmm_writedata[22:0]; 
  assign valid_csr_erase_addr = (csr_erase_addr != {(23){1'b1}}); 
  assign valid_csr_write = (avmm_write & avmm_addr); 
  assign csr_control_signal = { csr_erase_state, {(2){1'b1}}, csr_wp_mode, csr_sector_page_erase_addr_reg }; 
  assign csr_control = csr_control_signal; 
  assign avmm_readdata = (csr_control_access) ? csr_control_signal : { {(22){1'b1}}, csr_status[9:0] }; 
  assign reset_n_w = reset_n_reg2; 
  initial begin 
  csr_sector_page_erase_addr_reg <= {(23){1'b1}}; 
  csr_wp_mode = {(5){1'b1}}; 
  csr_erase_state = ERASE_ST_IDLE; 
  csr_control_access = 1'b0; 
  reset_n_reg1 = 1'b0; 
  reset_n_reg2 = 1'b0; 
  end 
  always @ (negedge reset_n or posedge clock) begin 
  if (~reset_n) begin 
  {reset_n_reg2, reset_n_reg1} <= 2'b0; 
  end 
  else begin 
  {reset_n_reg2, reset_n_reg1} <= {reset_n_reg1, 1'b1}; 
  end 
  end 
  always @ (posedge clock) begin 
  if (~reset_n_w) begin 
  csr_sector_page_erase_addr_reg <= {(23){1'b1}}; 
  csr_wp_mode <= {(5){1'b1}}; 
  csr_erase_state <= ERASE_ST_IDLE; 
  csr_control_access <= 1'b0; 
  end 
  else begin 
  if (avmm_read) begin 
  csr_control_access <= avmm_addr; 
  end 
  if (valid_csr_write) begin 
  csr_wp_mode <= avmm_writedata[27:23]; 
  if (is_idle) begin 
  csr_sector_page_erase_addr_reg <= avmm_writedata[22:0]; 
  end 
  end 
  case (csr_erase_state) 
  ERASE_ST_IDLE: 
  if (is_idle && valid_csr_write && valid_csr_erase_addr) begin 
  csr_erase_state <= ERASE_ST_PENDING; 
  end 
  ERASE_ST_PENDING: 
  if (is_erase_busy) begin 
  csr_erase_state <= ERASE_ST_BUSY; 
  end 
  ERASE_ST_BUSY: 
  if (is_idle) begin 
  csr_erase_state <= ERASE_ST_IDLE; 
  end 
  default: begin 
  csr_erase_state <= ERASE_ST_IDLE; 
  end 
  endcase 
  end 
  end 
 endmodule