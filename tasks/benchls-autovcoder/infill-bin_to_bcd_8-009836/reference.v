module autovcoder_009836 (
    input  [7:0] bin_in,
    input        sampling,
    input        clk,
    input        rst,
    output       flag,
    output [9:0] bcd_out
);

  reg [17:0] bcd_out_r;
  reg [17:0] tmp_bcd_out_r;
  reg [ 5:0] counter;


  assign bcd_out = (counter == 5'd15) ? bcd_out_r[17:8] : 'b0;
  assign flag = (counter == 5'd15) ? 1'b1 : 'b0;

  always @(posedge clk) begin
    if (rst) begin
      counter       <= 'b0;
      bcd_out_r     <= bin_in;
      tmp_bcd_out_r <= bin_in;

    end else if (sampling || (counter == 5'd15)) begin
      counter       <= 'b0;
      bcd_out_r     <= bin_in;
      tmp_bcd_out_r <= bin_in;

    end else begin
      if (counter[0] == 0) begin
        bcd_out_r[17:1]     <= bcd_out_r[16:0];
        tmp_bcd_out_r[17:1] <= bcd_out_r[16:0];
        counter             <= counter + 1;
      end else begin
        if (tmp_bcd_out_r[11:8] >= 3'd5) begin
          bcd_out_r[11:8] <= bcd_out_r[11:8] + 4'b0011;
        end else begin
          bcd_out_r[11:8] <= bcd_out_r[11:8];
        end
        if (tmp_bcd_out_r[15:12] >= 3'd5) begin
          bcd_out_r[15:12] <= bcd_out_r[15:12] + 4'b0011;
        end else begin
          bcd_out_r[15:12] <= bcd_out_r[15:12];
        end
        if (counter < 5'd16) begin
          counter <= counter + 1;
        end else begin
          counter <= 'b0;
        end
      end

    end

  end


endmodule

