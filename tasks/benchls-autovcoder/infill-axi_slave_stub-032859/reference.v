module autovcoder_032859 (
    input io_axi_arw_valid,
    output io_axi_arw_ready,
    input [31:0] io_axi_arw_payload_addr,
    input [2:0] io_axi_arw_payload_size,
    input [3:0] io_axi_arw_payload_cache,
    input [2:0] io_axi_arw_payload_prot,
    input io_axi_arw_payload_write,
    input io_axi_w_valid,
    output io_axi_w_ready,
    input [31:0] io_axi_w_payload_data,
    input [3:0] io_axi_w_payload_strb,
    input io_axi_w_payload_last,
    output io_axi_b_valid,
    input io_axi_b_ready,
    output [1:0] io_axi_b_payload_resp,
    output io_axi_r_valid,
    input io_axi_r_ready,
    output [31:0] io_axi_r_payload_data,
    output [1:0] io_axi_r_payload_resp,
    output io_axi_r_payload_last,
    input toplevel_io_axiClk,
    input toplevel_resetCtrl_axiReset
);
  wire _zz_1_;
  reg consumeData;
  reg sendReadRsp;
  reg sendWriteRsp;
  reg [7:0] remaining;
  wire remainingZero;

  initial begin
    consumeData  = 0;
    sendReadRsp  = 0;
    sendWriteRsp = 0;
    remaining    = 0;
  end

  assign _zz_1_ = (io_axi_arw_valid && io_axi_arw_ready);
  assign remainingZero = (remaining == (8'b00000000));
  assign io_axi_arw_ready = (!((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_w_ready = consumeData;
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = (2'b11);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = (2'b11);
  assign io_axi_r_payload_last = remainingZero;
  always @(posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      consumeData  <= 1'b0;
      sendReadRsp  <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if (_zz_1_) begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (!io_axi_arw_payload_write);
      end
      if (((io_axi_w_valid && io_axi_w_ready) && io_axi_w_payload_last)) begin
        consumeData  <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if ((io_axi_b_valid && io_axi_b_ready)) begin
        sendWriteRsp <= 1'b0;
      end
      if (sendReadRsp) begin
        if (io_axi_r_ready) begin
          if (remainingZero) begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @(posedge toplevel_io_axiClk) begin
    if (_zz_1_) begin
      remaining <= (8'b00000000);
    end
    if (sendReadRsp) begin
      if (io_axi_r_ready) begin
        remaining <= (remaining - (8'b00000001));
      end
    end
  end

endmodule

