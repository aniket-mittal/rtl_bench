module LUT_0(
   output reg [26:0] bits,
   input [3:0] percent
);
  always @* begin
    case (percent)
      4'b0000: bits = 27'b000000000000000000000000001;
      4'b0001: bits = 27'b000000000000000000000000010;
      4'b0010: bits = 27'b000000000000000000000000100;
      4'b0011: bits = 27'b000000000000000000000001000;
      // ... other cases for different percentages
      default: bits = 27'b000000000000000000000000000;
    endcase
  end
endmodule