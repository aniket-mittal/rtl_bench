module autovcoder_116936 (
    input PixClk,
    output reg HSync,
    output reg VSync,
    output reg Video
);

  // -----------------------------------
  // 640x360@60Hz  -- PixClk = 25.200MHz
  // -----------------------------------
  parameter integer H_sync_start = 656;
  parameter integer H_sync_stop = 751;
  parameter integer H_img_start = 0;
  parameter integer H_img_stop = 639;
  parameter integer H_screen_stop = 799;
  parameter integer H_polarity = 1'b0;
  parameter integer V_sync_start = 361;
  parameter integer V_sync_stop = 364;
  parameter integer V_img_start = 0;
  parameter integer V_img_stop = 359;
  parameter integer V_screen_stop = 449;
  parameter integer V_polarity = 1'b0;

  reg [10:0] Row;
  reg [10:0] Col;

  initial begin
    Row   = 11'h000;
    Col   = 11'h000;
    HSync = 1'b0;
    VSync = 1'b0;
    Video = 1'b0;
  end

  [MASKED]

endmodule

