module origen_204224(
    input clk,
    input gameEnd,
    output reg [7:0] led
);

`define OUTER 8'b10000001
`define MIDDLE_TWO 8'b01000010
`define MIDDLE_ONE 8'b00100100
`define INNER 8'b00011000
`define HALF_ONE 8'b00000011
`define HALF_TWO 8'b00001100
`define HALF_THREE 8'b00110000
`define HALF_FOUR 8'b11000000

`define LED_ZERO 8'b00000001
`define LED_ONE 8'b00000010
`define LED_TWO 8'b00000100
`define LED_THREE 8'b00001000
`define LED_FOUR 8'b00010000
`define LED_FIVE 8'b00100000
`define LED_SIX 8'b01000000
`define LED_SEVEN 8'b10000000

always @(posedge clk) begin
    if (~gameEnd) begin
        case (led)
            `OUTER: led <= `MIDDLE_TWO;
            `MIDDLE_TWO: led <= `MIDDLE_ONE;
            `MIDDLE_ONE: led <= `INNER;
            `INNER: led <= `HALF_THREE;
            `HALF_THREE: led <= `HALF_ONE;
            `HALF_ONE: led <= `HALF_FOUR;
            `HALF_FOUR: led <= `HALF_TWO;
            `HALF_TWO: led <= `OUTER;
            default: led <= `OUTER;
        endcase
    end
    else begin
        case (led)
            `LED_SEVEN: led <= `LED_SIX;
            `LED_SIX: led <= `LED_FIVE;
            `LED_FIVE: led <= `LED_FOUR;
            `LED_FOUR: led <= `LED_THREE;
            `LED_THREE: led <= `LED_TWO;
            `LED_TWO: led <= `LED_ONE;
            `LED_ONE: led <= `LED_ZERO;
            `LED_ZERO: led <= `LED_SEVEN;
            default: led <= `LED_SEVEN;
        endcase
    end
end

endmodule