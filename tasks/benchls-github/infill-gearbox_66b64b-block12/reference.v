module gearbox_66b64b (
  input             clk,
  input             reset,

  input      [65:0] i_data,
  input             i_valid,

  output reg [63:0] o_data,
  output            o_rd_en
);

  reg  [65:0] buff_r;
  reg  [ 5:0] gear_cnt;
  wire        pause;
  wire [63:0] gears [0:32];

  always @(posedge clk) begin
    if (i_valid) begin
      buff_r <= i_data;
    end
  end

  always @(posedge clk) begin
    if (reset) begin
      gear_cnt <= 6'd0;
    end else if (gear_cnt[5]) begin
      gear_cnt <= 6'd0;
    end else begin
      gear_cnt <= gear_cnt + 1'b1;
    end
  end

  assign pause = gear_cnt[5];

  generate
    genvar i;
    for (i=0; i < 33; i=i+1) begin
      if (i == 0) begin
        assign gears[0] = i_data[63:0];
      end else if (i == 32) begin
        assign gears[32] = buff_r[65:2];
      end else begin
        assign gears[i] = {i_data[63-2*i:0], buff_r[65:66-2*i]};
      end
    end
  endgenerate

  always @(posedge clk) begin
    o_data <= gears[gear_cnt];
  end

  assign o_rd_en = ~pause;

endmodule