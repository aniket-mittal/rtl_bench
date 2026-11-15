module autovcoder_071244 #(
    parameter MW = 2
) (
    input            clk,
    input            rst,
    input            cenop,
    input            zero,
    input      [7:0] start_value,
    input            load,
    input            clr_flag,
    output reg       flag,
    output reg       overflow
);

  reg [7:0] cnt, next, init;
  reg [MW-1:0] free_cnt, free_next;
  reg load_l, free_ov;

  always @(posedge clk)
    if (clr_flag || rst) flag <= 1'b0;
    else if (cenop && zero && load && overflow) flag <= 1'b1;

  always @(*) begin
    {free_ov, free_next} = {1'b0, free_cnt} + 1'b1;
    /* verilator lint_off WIDTH */
    {overflow, next} = {1'b0, cnt} + free_ov;
    /* verilator lint_on WIDTH */
    init = start_value;
  end

  always @(posedge clk) begin
    load_l <= load;
    if ((!load_l && load) || rst) begin
      cnt <= start_value;
    end else if (cenop && zero && load) begin
      cnt <= overflow ? init : next;
    end
  end

  // Free running counter, resetting
  // the value of this part with the load
  // event can slow down music, vg Bad Dudes
  always @(posedge clk) begin
    if (rst) begin
      free_cnt <= 0;
    end else if (cenop && zero) begin
      free_cnt <= free_next;
    end
  end

endmodule

