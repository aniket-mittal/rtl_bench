module autovcoder_095810 (
    clk,
    rst_n,
    wren,
    addr,
    data
);
  input clk;
  input rst_n;
  output reg wren;  //read and write signal
  output reg [7:0] addr;  //address signal
  output reg [7:0] data;  //
  reg state;
  [MASKED]
endmodule

