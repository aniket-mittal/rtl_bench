module origen_190477(
  input pxlClk,
  input rst,
  input [11:0] hcnt,
  input [11:0] vcnt,
  input [11:0] hsize,
  input [11:0] vsize,
  input pause,
  output reg [7:0] pixel_r_out,
  output reg [7:0] pixel_g_out,
  output reg [7:0] pixel_b_out,
  output reg [7:0] pixel_a_out
);

  reg [32:0] counter;
  reg [1:0] picNum;
  reg [7:0] realAlpha;
  reg [1:0] pause_reg;

  always @(posedge pxlClk or posedge rst) begin
    if (rst) begin
      counter <= 0;
      picNum <= 0;
      pause_reg <= 0;
    end else begin
      if (~pause) begin
        counter <= counter + 1;
        pause_reg <= 0;
      end else begin
        pause_reg <= pause_reg + 1;
      end
      picNum <= counter[32:31];
    end
  end

  always @* begin
    case (picNum)
      2'b00: begin
        if ((hcnt == 0) || (hcnt == hsize-1) || (vcnt == 0) || (vcnt == vsize-1)) begin
          pixel_r_out = 8'hFF;
          pixel_g_out = 8'hFF;
          pixel_b_out = 8'hFF;
          realAlpha = 8'hFF;
        end else begin
          pixel_r_out = 0;
          pixel_g_out = 0;
          pixel_b_out = 0;
          realAlpha = 0;
        end
      end
      2'b01: begin
        if ((hcnt == 0) || (hcnt == hsize-1) || (vcnt == 0) || (vcnt == vsize-1)) begin
          pixel_r_out = 8'hFF;
          pixel_g_out = 8'hFF;
          pixel_b_out = 8'hFF;
          realAlpha = 8'hFF;
        end else begin
          pixel_r_out = 0;
          pixel_g_out = 0;
          pixel_b_out = 0;
          realAlpha = 0;
        end
      end
      2'b10: begin
        if ((hcnt >= (hsize/4)) && (hcnt < (3*hsize/4)) && (vcnt >= (vsize/4)) && (vcnt < (3*vsize/4))) begin
          pixel_r_out = 8'hFF;
          pixel_g_out = 8'hFF;
          pixel_b_out = 8'hFF;
          realAlpha = 8'hFF;
        end else begin
          pixel_r_out = 0;
          pixel_g_out = 0;
          pixel_b_out = 0;
          realAlpha = 0;
        end
      end
      2'b11: begin
        if (((hcnt ^ vcnt) & 8'h10) == 0) begin
          pixel_r_out = 8'hFF;
          pixel_g_out = 8'hFF;
          pixel_b_out = 8'hFF;
          realAlpha = 8'hFF;
        end else begin
          pixel_r_out = 0;
          pixel_g_out = 0;
          pixel_b_out = 0;
          realAlpha = 8'h80;
        end
      end
    endcase
  end

  always @* begin
    pixel_a_out = realAlpha;
  end

endmodule