module mg_04136 (etx_rd_wait, etx_wr_wait, etx_ack, tx_frame_par, tx_data_par,ecfg_tx_datain,reset, etx_access, etx_write, etx_datamode, etx_ctrlmode,etx_dstaddr, etx_srcaddr, etx_data, tx_lclk_par, tx_rd_wait,tx_wr_wait);
input reset; 
  input etx_access; 
  input etx_write; 
  input [1:0] etx_datamode; 
  input [3:0] etx_ctrlmode; 
  input [31:0] etx_dstaddr; 
  input [31:0] etx_srcaddr; 
  input [31:0] etx_data; 
  output etx_rd_wait; 
  output etx_wr_wait; 
  output etx_ack; 
  input tx_lclk_par; 
  output [7:0] tx_frame_par; 
  output [63:0] tx_data_par; 
  input tx_rd_wait; 
  input tx_wr_wait; 
  output [1:0] ecfg_tx_datain; 
  reg etx_ack; 
  reg [7:0] tx_frame_par; 
  reg [63:0] tx_data_par; 
  always @( posedge tx_lclk_par or posedge reset ) 
  begin 
  if(reset) 
  begin 
  etx_ack <= 1'b0; 
  tx_frame_par[7:0] <= 8'd0; 
  tx_data_par[63:0] <= 64'd0; 
  end 
  else 
  begin 
  if( etx_access & ~etx_ack ) 
  begin 
  etx_ack <= 1'b1; 
  tx_frame_par[7:0] <= 8'h3F; 
  tx_data_par[63:0] <= {8'd0, 
  8'd0, 
  ~etx_write, 7'd0, 
  etx_ctrlmode[3:0], etx_dstaddr[31:28], 
  etx_dstaddr[27:4], 
  etx_dstaddr[3:0], etx_datamode[1:0], etx_write, etx_access 
  }; 
  end 
  else if( etx_ack ) 
  begin 
  etx_ack <= 1'b0; 
  tx_frame_par[7:0] <= 8'hFF; 
  tx_data_par[63:0] <= { etx_data[31:0], etx_srcaddr[31:0]}; 
  end 
  else 
  begin 
  etx_ack <= 1'b0; 
  tx_frame_par[7:0] <= 8'h00; 
  tx_data_par[63:0] <= 64'd0; 
  end 
  end 
  end 
  reg rd_wait_sync; 
  reg wr_wait_sync; 
  reg etx_rd_wait; 
  reg etx_wr_wait; 
  always @ (posedge tx_lclk_par) 
  begin 
  rd_wait_sync <= tx_rd_wait; 
  etx_rd_wait <= rd_wait_sync; 
  wr_wait_sync <= tx_wr_wait; 
  etx_wr_wait <= wr_wait_sync; 
  end 
  assign ecfg_tx_datain[1:0] = {etx_wr_wait, 
  etx_rd_wait}; 
 endmodule