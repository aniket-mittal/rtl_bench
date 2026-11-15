module gearbox_64b66b (
  input             clk,
  input             reset,

  input      [63:0] i_data,

  output reg [65:0] o_data,
  output reg        o_valid
);

  reg  [63:0] buff_r;
  reg  [ 5:0] gear_cnt;
  wire        invalid;
  wire [65:0] gears [0:32];

  always @(posedge clk) begin
    buff_r <= i_data;
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

  assign invalid = gear_cnt == 0;

  generate
    genvar i;
    for (i=0; i < 33; i=i+1) begin
      if (i == 0) begin
        assign gears[0] = 66'hx; // Invalid, don't care
      end else begin
        assign gears[i] = {i_data[2*i-1:0], buff_r[63:2*(i-1)]};
      end
    end
  endgenerate

  always @(posedge clk) begin
    o_data <= gears[gear_cnt];
    o_valid <= ~invalid;
  end

endmodule