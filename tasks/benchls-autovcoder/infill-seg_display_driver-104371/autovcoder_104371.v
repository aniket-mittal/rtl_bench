module autovcoder_104371 (
    input switch,
    input [3:0] med,
    input [3:0] low,
    output reg [3:0] sel = 4'b1101,
    output reg [7:0] data
);


  always @(*) begin
    if (switch == 1) sel <= 4'b1101;
    else sel <= 4'b1110;
  end
  //8'b 1 1 1 1 _ 1 1 1 1;
  //    a b c d   e f g h


  [MASKED]
endmodule

