module autovcoder_031602 (
    input advanced_sw,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    output reg [3:0] VGA_Red_Grid,
    output reg [3:0] VGA_Green_Grid,
    output reg [3:0] VGA_Blue_Grid
);

  //scaled wave properties
  parameter scale = 6;
  parameter xadjust = 30;
  parameter yadjust = 750;

  //envelope wave properties
  parameter scale2 = 6;
  parameter xadjust2 = 1280 - 30 - (1280 / scale2);
  parameter yadjust2 = 750;

  [MASKED]
endmodule

