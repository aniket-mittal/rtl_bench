module origen_185238
  #(
    parameter METHOD = 0
    )
   (
    input  [7:0] in,
    output reg [3:0] out
    );

   always @(*) begin
      if (METHOD == 0) begin
         case (in)
           8'h30: out = 4'h0; // 0
           8'h31: out = 4'h1; // 1
           8'h32: out = 4'h2; // 2
           8'h33: out = 4'h3; // 3
           8'h34: out = 4'h4; // 4
           8'h35: out = 4'h5; // 5
           8'h36: out = 4'h6; // 6
           8'h37: out = 4'h7; // 7
           8'h38: out = 4'h8; // 8
           8'h39: out = 4'h9; // 9
           8'h41: out = 4'hA; // A
           8'h42: out = 4'hB; // B
           8'h43: out = 4'hC; // C
           8'h44: out = 4'hD; // D
           8'h45: out = 4'hE; // E
           8'h46: out = 4'hF; // F
           8'h61: out = 4'hA; // a
           8'h62: out = 4'hB; // b
           8'h63: out = 4'hC; // c
           8'h64: out = 4'hD; // d
           8'h65: out = 4'hE; // e
           8'h66: out = 4'hF; // f
           default: out = 4'h0;
         endcase
      end else begin
         if (in[6]) begin
            if (in >= 8'h41 && in <= 8'h46)
              out = in - 8'h41 + 4'hA;
            else if (in >= 8'h61 && in <= 8'h66)
              out = in - 8'h61 + 4'hA;
            else
              out = 4'h0;
         end else begin
            out = in - 8'h30;
         end
      end
   end

endmodule