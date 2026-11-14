module autovcoder_027915 (
    rst_n,
    indata,
    outdata,
    clk
);

  input rst_n, clk;
  input [1:0] indata;
  output outdata;
  reg [3:0] buffer;
  reg bufferdata;
  reg counterv;

  always @(posedge clk or negedge rst_n) begin  // 设置四位buffer暂存前四位数据
    if (!rst_n) begin
      buffer[3] <= 0;
      buffer[2] <= 0;
      buffer[1] <= 0;
      buffer[0] <= 0;
    end else begin
      buffer[3] <= buffer[2];
      buffer[2] <= buffer[1];
      buffer[1] <= buffer[0];
      buffer[0] <= bufferdata;
    end
  end


  [MASKED]

  assign outdata = (counterv == 1) ? 0 : buffer[2];

endmodule

