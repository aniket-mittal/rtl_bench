module zet_bitlog (
    input  [15:0] x,
    output [15:0] o,
    output        cfo,
    output        ofo
  );

  // Assignments
  assign o = ~x;  // Now we only do NEG

  [MASKED]

endmodule