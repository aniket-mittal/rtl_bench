`ifndef MAX
`define MAX 8'hff
`endif

`ifndef MIN
`define MIN 8'h00
`endif

`ifndef TIK
`define TIK 1
`endif

`ifdef DEBUG_DEBOUNCE
output dclk, dkeyBounce;
`endif

module origen_157439(
    input clk,
    input keyBounce,
    output keyDeBounce
);

reg [7:0] counter = `MIN;
reg lockDeBounce = 1'b1;

assign keyDeBounce = lockDeBounce ? 1'b1 : keyBounce;

`ifdef DEBUG_DEBOUNCE
assign dclk = clk;
assign dkeyBounce = keyBounce;
`endif

always @(posedge clk) begin
    if (counter == `MIN) begin
        lockDeBounce <= 1'b1;
        if (~keyBounce)
            counter <= counter + `TIK;
    end else if (counter == `MAX) begin
        lockDeBounce <= 1'b0;
        if (keyBounce)
            counter <= counter - `TIK;
    end else begin
        if (lockDeBounce) begin
            if (~keyBounce)
                counter <= counter + `TIK;
            else
                counter <= `MIN;
        end else begin
            if (keyBounce)
                counter <= counter - `TIK;
            else
                counter <= `MAX;
        end
    end
end

endmodule