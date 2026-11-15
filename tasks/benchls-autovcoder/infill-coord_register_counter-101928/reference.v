module autovcoder_101928 (
    input clk,
    input resetn,
    input enableCounter,
    input ld_x,
    ld_y,
    ld_c,
    input [6:0] coordIn,
    input [2:0] colourIn,
    output [6:0] xOut,
    yOut,
    output [2:0] colourOut
);

  // input registers
  reg [6:0] x, y;
  reg [2:0] colour;

  // Registers a, b, c, x with respective input logic
  always @(posedge clk) begin
    if (!resetn) begin
      y <= 7'b0;
      colour <= 3'b0;
      x <= 7'b0;
    end else begin
      if (ld_x)
        x <= coordIn;  // load alu_out if load_alu_out signal is high, otherwise load from data_in
      if (ld_y)
        y <= coordIn;  // load alu_out if load_alu_out signal is high, otherwise load from data_in
      if (ld_c) colour <= colourIn;
    end
  end

  reg [3:0] count = 4'b1111;

  //counter
  always @(posedge clk) begin
    if (!resetn) begin
      count <= 4'b0000;
    end else if (enableCounter) begin
      if (count == 4'b1111) begin
        count <= 4'b0000;
      end else begin
        count = count + 1'b1;
      end
    end
  end


  assign xOut = x + count[1:0];
  assign yOut = y + count[3:2];
  assign colourOut = colour;

endmodule

