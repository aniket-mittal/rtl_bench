module autovcoder_060692 #(
    parameter MID_WIDTH = 29
) (
    // input data
    input  wire [MID_WIDTH-1 : 0] a1,
    input  wire [MID_WIDTH-1 : 0] a2,
    input  wire                   en,
    // output data
    output wire [MID_WIDTH-1 : 0] max_o
);
  reg _m;  // larger data index, 0 -- a1, 1 -- a2
  assign max_o = _m ? a2 : a1;
  wire [MID_WIDTH-1:0] _diff;  // result of a minus b
  assign _diff = {1'b0, a1[MID_WIDTH-2:0]} - {1'b0, a2[MID_WIDTH-2:0]};

  [MASKED]

endmodule

