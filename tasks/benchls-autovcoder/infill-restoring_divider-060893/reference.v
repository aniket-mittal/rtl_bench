module autovcoder_060893 #(
    parameter WIDTH = 11
) (
    output wire [WIDTH-1:0] o_w_quot,
    output wire o_w_rdy,
    input wire i_w_clk,
    input wire i_w_rst,
    input wire [WIDTH-1:0] i_w_num,
    input wire [WIDTH-1:0] i_w_den
);
  // Double width for shifting (when "lowering zeroes")
  reg [(2*WIDTH)-1:0] l_r_num;
  reg [(2*WIDTH)-1:0] l_r_num_next;

  reg l_r_rdy, l_r_working;
  integer i;

  reg [WIDTH-1:0] quot;

  always @(posedge i_w_clk) begin
    if (i_w_rst) begin
      l_r_rdy <= 0;
      l_r_working <= 1;
      quot <= 0;
      i <= WIDTH - 1;
      l_r_num <= i_w_num;
    end else if (l_r_working) begin
      if (i == 0) begin
        l_r_working <= 0;
        l_r_rdy <= 1;
      end else begin
        i <= i - 1;
        l_r_num <= l_r_num_next;
      end
    end
  end

  always @(*) begin
    if (l_r_num >= i_w_den) begin
      l_r_num_next = (l_r_num - i_w_den) << 1;
      quot[i] = 1;
    end else begin
      l_r_num_next = l_r_num << 1;
    end
  end

  assign o_w_rdy  = l_r_rdy;
  assign o_w_quot = quot;

endmodule

