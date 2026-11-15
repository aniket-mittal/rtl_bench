module autovcoder_018001 #(
    parameter Bits = 2
) (
    input [3:0] sel,
    input [(Bits - 1):0] in_0,
    input [(Bits - 1):0] in_1,
    input [(Bits - 1):0] in_2,
    input [(Bits - 1):0] in_3,
    input [(Bits - 1):0] in_4,
    input [(Bits - 1):0] in_5,
    input [(Bits - 1):0] in_6,
    input [(Bits - 1):0] in_7,
    input [(Bits - 1):0] in_8,
    input [(Bits - 1):0] in_9,
    input [(Bits - 1):0] in_10,
    input [(Bits - 1):0] in_11,
    input [(Bits - 1):0] in_12,
    input [(Bits - 1):0] in_13,
    input [(Bits - 1):0] in_14,
    input [(Bits - 1):0] in_15,
    output reg [(Bits - 1):0] out
);
  always @(*) begin
    case (sel)
      4'h0: out = in_0;
      4'h1: out = in_1;
      4'h2: out = in_2;
      4'h3: out = in_3;
      4'h4: out = in_4;
      4'h5: out = in_5;
      4'h6: out = in_6;
      4'h7: out = in_7;
      4'h8: out = in_8;
      4'h9: out = in_9;
      4'ha: out = in_10;
      4'hb: out = in_11;
      4'hc: out = in_12;
      4'hd: out = in_13;
      4'he: out = in_14;
      4'hf: out = in_15;
      default: out = 'h0;
    endcase
  end
endmodule

