module autovcoder_074377 (
    input wire clk,
    input wire ready,
    input wire [127:0] line,
    output reg [7:0] char = 0,
    output reg writeChar = 0,
    output reg home = 0
);

  `define AssignChar(__ofs) assign charArray[__ofs] = line[__ofs * 8 + 7 : __ofs * 8];


  wire [7:0] charArray[0:63];

  //assign char0 = line[7:0];

  `AssignChar(0)
  `AssignChar(1)
  `AssignChar(2)
  `AssignChar(3)
  `AssignChar(4)
  `AssignChar(5)
  `AssignChar(6)
  `AssignChar(7)
  `AssignChar(8)
  `AssignChar(9)
  `AssignChar(10)
  `AssignChar(11)
  `AssignChar(12)
  `AssignChar(13)
  `AssignChar(14)
  `AssignChar(15)

  reg [7:0] state = 0;

  always @(posedge clk)
    if (ready) begin
      if (!writeChar && !home) begin
        if (state != 16) begin
          char <= charArray[state] != 'h00 ? charArray[state] : 'h20;
          writeChar <= 1;
          state <= state + 1;
        end else begin
          state <= 0;
          writeChar <= 0;
          home <= 1;
        end
      end
    end else begin
      writeChar <= 0;
      home <= 0;
    end

endmodule

