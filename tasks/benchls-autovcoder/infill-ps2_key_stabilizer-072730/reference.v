module autovcoder_072730 (
    clock,
    clock_b,
    resetn,
    ps2_out,  /*field,*/
    stableKey
);

  input clock, clock_b, resetn;
  input [7:0] ps2_out;
  //output reg [0:99] field;
  output reg [7:0] stableKey;

  reg [7:0] keySignal;
  integer count_b;
  reg countFlag;

  initial begin
    //field <= 100'h7000000;
    keySignal <= 8'b0;
    count_b   <= 1;
  end

  // Original version --------------------------------------------------
  /*always @(posedge clock) begin
		if (ps2_out > 8'b0) keySignal <= ps2_out;
		if (keySignal > 8'b0) count_b = count_b + 1;
		if (count_b > 'd4999900) begin
			keySignal <= 8'b0; // Extend ps2_out value from 40 ns to 200 ms.
			count_b <= 1;
		end
	end*/
  // -----------------------------------------------------------------

  // Improved version
  always @(posedge clock) begin
    if (ps2_out > 8'b0 && count_b < 'd4) keySignal <= ps2_out;
    if (keySignal > 8'b0 && count_b < 'd4999900) count_b = count_b + 1;
    else if (count_b >= 'd4999890) begin
      keySignal <= ps2_out;  // Extend ps2_out value from 40 ns to 100 ms.
      count_b   <= 1;
    end
  end

  always @(posedge clock_b) begin
    /*
		if (~resetn) field <= 100'h7000000;
		else if (keySignal == 8'h34) field <= field >> 1'b1;
		else if (keySignal == 8'h23) field <= field << 1'b1;
		else if (keySignal == 8'h2d) field <= field << 'd10;
		else if (keySignal == 8'h2b) field <= field >> 'd10;
		*/
    stableKey <= keySignal;
  end

endmodule

