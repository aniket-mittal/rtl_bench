module origen_099616 #(
  parameter NUM_CNT_BITS = 4
)(
  input wire clk,
  input wire n_rst,
  input wire clr,
  input wire count_enable,
  input wire [NUM_CNT_BITS-1:0] rollover_val,
  output reg [NUM_CNT_BITS-1:0] count_out,
  output reg rollover_flag
);

  reg [NUM_CNT_BITS-1:0] count;
  reg curr_rollover, next_rollover;

  // Sequential logic
  always @(posedge clk or negedge n_rst) begin
    if (~n_rst) begin
      count_out <= {NUM_CNT_BITS{1'b0}};
      rollover_flag <= 1'b0;
    end else begin
      count_out <= count;
      rollover_flag <= curr_rollover;
    end
  end

  // Combinational logic
  always @(*) begin
    count = count_out;
    next_rollover = curr_rollover;

    if (clr) begin
      count = {NUM_CNT_BITS{1'b0}};
      next_rollover = 1'b0;
    end else if (count_enable) begin
      if (count_out == rollover_val) begin
        count = {NUM_CNT_BITS{1'b0}};
        next_rollover = 1'b1;
      end else begin
        count = count_out + 1'b1;
        next_rollover = 1'b0;
      end
    end
  end

  // Update current rollover state
  always @(posedge clk or negedge n_rst) begin
    if (~n_rst) begin
      curr_rollover <= 1'b0;
    end else begin
      curr_rollover <= next_rollover;
    end
  end

endmodule