module autovcoder_073720 (
    input [4:0] tone_idx,
    output reg [31:0] tone
);

  parameter NM1 = 32'd262;  // C_freq
  parameter NM2 = 32'd294;  // D_freq
  parameter NM3 = 32'd330;  // E_freq
  parameter NM4 = 32'd349;  // F_freq
  parameter NM5 = 32'd392;  // G_freq
  parameter NM6 = 32'd440;  // A_freq
  parameter NM7 = 32'd494;  // B_freq
  parameter NM0 = 32'd10000;  // obvious high freq tone
  always @(*) begin
    case (tone_idx)
      5'd0: tone = NM1;  // C4
      5'd1: tone = NM2;
      5'd2: tone = NM3;
      5'd3: tone = NM4;
      5'd4: tone = NM5;
      5'd5: tone = NM6;
      5'd6: tone = NM7;
      5'd7: tone = NM1 << 1;  // C5
      5'd8: tone = NM2 << 1;
      5'd9: tone = NM3 << 1;
      5'd10: tone = NM4 << 1;
      5'd11: tone = NM5 << 1;
      5'd12: tone = NM6 << 1;
      5'd13: tone = NM7 << 1;
      5'd14: tone = NM1 << 2;  // C6
      5'd15: tone = NM2 << 2;
      5'd16: tone = NM3 << 2;
      5'd17: tone = NM4 << 2;
      5'd18: tone = NM5 << 2;
      5'd19: tone = NM6 << 2;
      5'd20: tone = NM7 << 2;
      5'd21: tone = NM1 << 3;  // C7
      5'd22: tone = NM2 << 3;
      5'd23: tone = NM3 << 3;
      5'd24: tone = NM4 << 3;
      5'd25: tone = NM5 << 3;
      5'd26: tone = NM6 << 3;
      5'd27: tone = NM7 << 3;
      5'd28: tone = NM1 << 4;  // C8
      default: tone = NM0;
    endcase
  end

endmodule

