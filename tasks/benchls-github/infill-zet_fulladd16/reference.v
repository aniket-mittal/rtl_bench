module zet_fulladd16 (
    input  [15:0] x,
    input  [15:0] y,
    input         ci,
    output        co,
    output [15:0] z,
    input         s
  );

  // Continuous assignments
  assign {co,z} = {1'b0, x} + {s, y} + ci;
endmodule