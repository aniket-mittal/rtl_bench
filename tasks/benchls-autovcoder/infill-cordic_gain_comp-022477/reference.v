module autovcoder_022477 #(
    parameter W = 32
) (
    input signed [W-1:0] x,
    input signed [W-1:0] y,
    input signed [W-1:0] z,
    input clk,
    input rst_n,
    input mode,
    input en,
    input [1:0] phase,
    output reg done,
    output reg mode_out,
    output reg signed [W-1:0] xt,
    output reg signed [W-1:0] yt,
    output reg signed [W-1:0] zt
);
  wire signed [W-1:0] deg180;
  assign deg180 = 32'd5898240;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      xt <= 0;
      yt <= 0;
      zt <= 0;
      mode_out <= 0;
      done <= 0;
    end else begin
      done <= en;
      if (en) begin
        mode_out <= mode;
        if (mode) begin
          zt <= z;
        end else if (phase == 2'b10) begin
          zt <= -(deg180) - z;
        end else if (phase == 2'b01) begin
          zt <= (deg180) - z;
        end else begin
          zt <= z;
        end
        xt <= (x>>>1)+(x>>>4)+(x>>>5)+(x>>>7)+(x>>>8)+(x>>>10)+(x>>>11)+(x>>>12)+(x>>>14); //xt <= xt *0.607253
        yt <= (y>>>1)+(y>>>4)+(y>>>5)+(y>>>7)+(y>>>8)+(y>>>10)+(y>>>11)+(y>>>12)+(y>>>14);
      end else begin
        xt <= 0;
        yt <= 0;
        zt <= 0;
        mode_out <= 0;
      end
    end
  end
endmodule

