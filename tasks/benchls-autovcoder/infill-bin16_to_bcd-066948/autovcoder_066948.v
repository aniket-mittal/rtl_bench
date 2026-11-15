module autovcoder_066948 (
    input  wire        clk,
    input  wire        rst,
    input  wire [15:0] hex_in,
    output wire [31:0] dec_out
);
  reg [31:0] ShiftReg = 32'h00000000;
  reg [ 4:0] count15;
  reg        pulse;

  always @(posedge clk) begin
    if (rst) pulse <= 1;
    else pulse <= 0;
  end

  always @(posedge clk) begin
    if (rst && ~pulse) count15 <= 15;
    else if (count15 >= 0 && count15 <= 15) count15 <= count15 - 1'b1;
    else count15 <= 5'd31;
  end

  [MASKED]

  assign dec_out = ShiftReg;

endmodule

