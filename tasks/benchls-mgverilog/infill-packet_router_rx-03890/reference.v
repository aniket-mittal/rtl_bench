module mg_03890 (rx_rd_wait, rx_wr_wait, edma_wait, ecfg_wait, rxwr_access,rxwr_packet, rxrd_access, rxrd_packet, rxrr_access, rxrr_packet,erx_rr_access, erx_packet, emmu_access, emmu_packet, edma_access,edma_packet, ecfg_access, ecfg_packet, timeout, rxwr_wait,rxrd_wait, rxrr_wait);
parameter AW = 32; 
  parameter DW = 32; 
  parameter PW = 104; 
  parameter ID = 12'h800; 
  parameter RFAW = 6; 
  input erx_rr_access; 
  input [PW-1:0] erx_packet; 
  output rx_rd_wait; 
  output rx_wr_wait; 
  input emmu_access; 
  input [PW-1:0] emmu_packet; 
  input edma_access; 
  input [PW-1:0] edma_packet; 
  output edma_wait; 
  input ecfg_access; 
  input [PW-1:0] ecfg_packet; 
  output ecfg_wait; 
  input timeout; 
  output rxwr_access; 
  output [PW-1:0] rxwr_packet; 
  input rxwr_wait; 
  output rxrd_access; 
  output [PW-1:0] rxrd_packet; 
  input rxrd_wait; 
  output rxrr_access; 
  output [PW-1:0] rxrr_packet; 
  input rxrr_wait; 
  wire emmu_write; 
  wire emmu_read; 
  wire [11:0] myid; 
  assign myid[11:0] = ID; 
  assign rxrr_access = erx_rr_access | 
  ecfg_access; 
  assign rxrr_packet[PW-1:0] = erx_rr_access ? erx_packet[PW-1:0] : 
  ecfg_packet[PW-1:0]; 
  assign ecfg_wait = erx_rr_access; 
  assign emmu_write = emmu_packet[1]; 
  assign rxwr_access = emmu_access & emmu_write; 
  assign rxwr_packet[PW-1:0] = emmu_packet[PW-1:0]; 
  assign emmu_read = emmu_access & ~emmu_write; 
  assign rxrd_access = emmu_read | edma_access; 
  assign rxrd_packet[PW-1:0] = emmu_read ? emmu_packet[PW-1:0] : 
  edma_packet[PW-1:0]; 
  assign rx_rd_wait = rxrd_wait; 
  assign rx_wr_wait = rxwr_wait | rxrr_wait; 
  assign edma_wait = rxrd_wait | emmu_read; 
  assign erx_cfg_wait = rxwr_wait | rxrr_wait; 
 endmodule