module DMux8Way(input in, input[2:0] sel, output E0, E1, E2, E3, E4, E5, E6, E7);
  assign {E7, E6, E5, E4, E3, E2, E1, E0} = 8'b1 << sel;
endmodule