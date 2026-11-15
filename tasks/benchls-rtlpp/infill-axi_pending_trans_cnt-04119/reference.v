module rtlpp_04119(
  active_trans,
  hold_write_trans,
  hold_read_trans,
  aclk, aresetn,
  awvalid, awready, 
  bvalid, bready, 
  arvalid, arready,
  rvalid, rlast, rready 
  );

parameter MAX_PENDTRANS_READ = 4;
parameter MAX_PENDTRANS_WRITE = 4;
parameter CNT_PENDTRANS_READ_W  = 3;
parameter CNT_PENDTRANS_WRITE_W = 3;

output active_trans;
output hold_write_trans;
output hold_read_trans;

input  aclk;
input  aresetn;
input  awvalid;
input  awready;
input  bvalid;
input  bready;
input  arvalid;
input  arready;
input  rlast;
input  rvalid;
input  rready;

reg  [CNT_PENDTRANS_READ_W-1:0]  read_pend_trans_cnt;
wire [CNT_PENDTRANS_READ_W-1:0]  read_pend_trans_cnt_c;
reg  [CNT_PENDTRANS_WRITE_W-1:0] write_pend_trans_cnt;
wire [CNT_PENDTRANS_WRITE_W-1:0] write_pend_trans_cnt_c;

wire       init_write_trans;
wire       init_read_trans;
wire       compl_write_trans;
wire       compl_read_trans;

wire       active_trans;
wire       hold_write_trans;
wire       hold_read_trans;

assign init_write_trans  = awvalid && awready; 
assign init_read_trans   = arvalid && arready;
assign compl_write_trans = bvalid && bready;
assign compl_read_trans  = rvalid && rlast && rready;

assign hold_read_trans  = (read_pend_trans_cnt  >= MAX_PENDTRANS_READ);
assign hold_write_trans = (write_pend_trans_cnt >= MAX_PENDTRANS_WRITE);

assign active_trans     = ( read_pend_trans_cnt > 0 ) ||
                          ( write_pend_trans_cnt > 0 ) || 
		          awvalid || arvalid;

assign read_pend_trans_cnt_c = read_pend_trans_cnt;
always@(posedge aclk or negedge aresetn)
begin:READ_PEND_TRANS_CNT_PROC
  if ( !aresetn )
    read_pend_trans_cnt <= {CNT_PENDTRANS_READ_W{1'b0}};
  else
  begin
    case ( { compl_read_trans, init_read_trans } )
      2'b00 : read_pend_trans_cnt <= read_pend_trans_cnt_c;
      2'b01 : if ( ~hold_read_trans )
                read_pend_trans_cnt <= read_pend_trans_cnt_c + 1;
              else
	        read_pend_trans_cnt <= read_pend_trans_cnt_c;
      2'b10 : read_pend_trans_cnt <= read_pend_trans_cnt_c - 1;
      2'b11 : read_pend_trans_cnt <= read_pend_trans_cnt_c;
    endcase
  end
end

assign write_pend_trans_cnt_c = write_pend_trans_cnt;
always@(posedge aclk or negedge aresetn)
begin:WRITE_PEND_TRANS_CNT_PROC
  if ( !aresetn )
    write_pend_trans_cnt <= {CNT_PENDTRANS_WRITE_W{1'b0}};
  else
  begin
    case ( { compl_write_trans, init_write_trans } )
      2'b00 : write_pend_trans_cnt <= write_pend_trans_cnt_c;
      2'b01 : if ( ~hold_write_trans )
                write_pend_trans_cnt <= write_pend_trans_cnt_c + 1;
              else
	        write_pend_trans_cnt <= write_pend_trans_cnt_c;
      2'b10 : write_pend_trans_cnt <= write_pend_trans_cnt_c - 1;
      2'b11 : write_pend_trans_cnt <= write_pend_trans_cnt_c;
    endcase
  end
end

endmodule