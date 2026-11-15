module autovcoder_085820 (
    input [6:0] DI,
    input CLK,
    input nDSYNC,
    output reg [6:0] R_o,
    output reg [6:0] G_o,
    output reg [6:0] B_o,
    output reg nCSYNC,
    output reg nHSYNC,
    output reg nVSYNC,
    output reg nCLAMP
);

  reg [1:0] cnt;
  reg skip;
  reg [2:0] serrcount;  // 240p: 3 hsync per vsync; 480i: 6 serrated hsync per vsync
  reg [1:0] linecount;  // PAL: Linecount[1:0] = 01; NTSC: Linecount[1:0] = 11
  reg vmode;

  [MASKED]
endmodule

