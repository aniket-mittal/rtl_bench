module autovcoder_022476 #(
    parameter W = 32
) (
    input signed [W-1:0] x,
    input signed [W-1:0] y,
    input signed [W-1:0] z,
    input clk,
    input rst_n,
    input mode,
    input en,
    output reg [1:0] phase,
    output reg en_out,
    output reg mode_out,
    output reg signed [W-1:0] xt,
    output reg signed [W-1:0] yt,
    output reg signed [W-1:0] zt
);
  wire signed [W-1:0] deg90;
  wire signed [W-1:0] deg181;
  assign deg90  = 32'd2949120;
  assign deg181 = 32'd5931008;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      xt <= 0;
      yt <= 0;
      zt <= 0;
      phase <= 2'b0;
      en_out <= 0;
      mode_out <= 0;
    end else begin
      en_out <= en;
      if (en) begin
        mode_out <= mode;
        if (mode) begin
          if ((z > (deg90)) && (z < (deg181))) begin
            xt <= -y;
            yt <= x;
            zt <= z - (deg90);
          end else begin
            if ((z < (-deg90)) && (z > (-deg181))) begin
              xt <= y;
              yt <= -x;
              zt <= z + (deg90);
            end else begin
              xt <= x;
              yt <= y;
              zt <= z;
            end
          end
        end else begin
          case ({
            x[W-1], y[W-1]
          })
            2'b00: begin
              xt <= x;
              phase <= 2'b00;
            end
            2'b01: begin
              xt <= x;
              phase <= 2'b11;
            end
            2'b10: begin
              xt <= -x;
              phase <= 2'b01;
            end
            2'b11: begin
              xt <= -x;
              phase <= 2'b10;
            end
            default: ;
          endcase
          yt <= y;
          zt <= z;
        end
      end else begin
        xt <= 0;
        yt <= 0;
        zt <= 0;
        phase <= 2'b0;
        mode_out <= 0;
      end
    end
  end  //end always 
endmodule

