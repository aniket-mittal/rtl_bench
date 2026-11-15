module autovcoder_095821 #(
    parameter WIDTH = 8,
    DEPTH = 8,
    NUMBER = 3
) (
    clk_1,
    clk_2,
    reset_n,
    cs_n,
    we_n,
    addr_r,
    addr_w,
    data_in,
    data_out
);

  input wire clk_1, clk_2, reset_n, cs_n, we_n;
  input wire [NUMBER-1:0] addr_r, addr_w;
  input wire [WIDTH-1:0] data_in;
  output reg [WIDTH-1:0] data_out;

  reg [WIDTH-1:0] ram[DEPTH-1:0];  //定义了一个存储器
  integer i, j;

  always @(posedge clk_1, negedge reset_n) begin
    if (!reset_n) begin
      data_out <= 0;
      for (i = 0; i < WIDTH; i = i + 1) ram[i] <= 0;
    end else if (!cs_n) begin
      if (!we_n) ram[addr_w] <= data_in;
      else;
    end else begin
      data_out <= 0;
    end
  end

  always @(posedge clk_2, negedge reset_n) begin
    if (!reset_n) begin
      data_out <= 0;
      for (j = 0; j < WIDTH; j = j + 1) ram[j] <= 0;
    end else if (!cs_n) begin
      if (we_n) data_out <= ram[addr_r];
      else;
    end else begin
      data_out <= 0;
    end
  end

endmodule

