module rtlpp_01385
(
  input wire        reset,
  input wire        clk,
  input wire [7:0]  tx_byte,
  input wire        tx_en,
  output reg        tx_busy,
  output reg        txd,
  input wire        baud_lock,
  input wire [15:0] baud_rate
); 

  reg [15:0] tx_cnt_16b;
  reg [3:0]  tx_bit_cnt;
  reg [9:0]  tx_sr;
  reg        txd_loc;
  reg        tx_shift;
  reg        tx_now;
  reg        tx_en_p1;
  reg        baud_lock_p1;
  reg        send_lf;

  always @(posedge clk) begin
    tx_shift     <= 0;
    tx_busy      <= 0;
    txd          <= txd_loc;
    txd_loc      <= tx_sr[0];
    tx_now       <= 0;
    tx_en_p1     <= tx_en;
    baud_lock_p1 <= baud_lock;   
    send_lf      <= baud_lock & ~ baud_lock_p1;

    if ((tx_en == 1 && tx_en_p1 == 0) || (send_lf == 1)) begin
      tx_bit_cnt <= 4'd10;
      tx_cnt_16b <= 16'h0000;
      tx_busy    <= 1;
      tx_shift   <= 1;
      tx_sr[9:0] <= {1'b1, tx_byte[7:0], 1'b0};
      if (send_lf == 1) begin
        tx_sr[9:0] <= {1'b1, 8'h0A, 1'b0};
      end 
    end else if (tx_bit_cnt != 4'd0) begin
      tx_cnt_16b <= tx_cnt_16b + 1;
      tx_busy    <= 1;
      if (tx_now == 1) begin
        tx_shift   <= 1;
        tx_bit_cnt <= tx_bit_cnt - 1;
        tx_cnt_16b <= 16'h0000;
        tx_sr[9:0] <= {1'b1, tx_sr[9:1]};
      end
    end else begin
      tx_sr <= 10'H3FF;
    end

    if (tx_cnt_16b == baud_rate) begin
      tx_now <= 1;
    end

    if (reset == 1) begin
      tx_bit_cnt <= 4'd0;
    end
  end
  
endmodule