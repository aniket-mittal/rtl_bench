module autovcoder_069598 #(
    parameter DIVISOR_WIDTH = 5,
    WIDTH_INVERSE = 17,
    WIDTH_SHIFT = 4
) (
    input [DIVISOR_WIDTH-1:0] divisor,

    output reg [WIDTH_INVERSE-1:0] div_inverse,
    output reg [  WIDTH_SHIFT-1:0] div_shift
);

  //inverses here all have 17 effective bits (the leftmost bit is 1)
  [MASKED]


  always @* begin
    case (divisor)
      5'd01:   div_shift = 5'd16;
      5'd02:   div_shift = 5'd17;
      5'd03:   div_shift = 5'd18;
      5'd04:   div_shift = 5'd18;
      5'd05:   div_shift = 5'd19;
      5'd06:   div_shift = 5'd19;
      5'd07:   div_shift = 5'd19;
      5'd08:   div_shift = 5'd19;
      5'd09:   div_shift = 5'd20;
      5'd10:   div_shift = 5'd20;
      5'd11:   div_shift = 5'd20;
      5'd12:   div_shift = 5'd20;
      5'd13:   div_shift = 5'd20;
      5'd14:   div_shift = 5'd20;
      5'd15:   div_shift = 5'd20;
      5'd16:   div_shift = 5'd20;
      5'd17:   div_shift = 5'd21;
      5'd18:   div_shift = 5'd21;
      5'd19:   div_shift = 5'd21;
      5'd20:   div_shift = 5'd21;
      5'd21:   div_shift = 5'd21;
      5'd22:   div_shift = 5'd21;
      5'd23:   div_shift = 5'd21;
      5'd24:   div_shift = 5'd21;
      5'd25:   div_shift = 5'd21;
      5'd26:   div_shift = 5'd21;
      5'd27:   div_shift = 5'd21;
      5'd28:   div_shift = 5'd21;
      5'd29:   div_shift = 5'd21;
      5'd30:   div_shift = 5'd21;
      5'd31:   div_shift = 5'd21;
      default: div_shift = 5'd16;
    endcase
  end

endmodule

