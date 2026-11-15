module Line_Buffer(
    input clken,
    input clock,
    input [11:0] shiftin,
    output [11:0] taps0x,
    output [11:0] taps1x
    );

reg [11:0] buffer_0;
reg [11:0] buffer_1;

always @(posedge clock) begin
    if (clken) begin
        buffer_1 <= buffer_0;
        buffer_0 <= shiftin;
    end
end

assign taps0x = buffer_1;
assign taps1x = buffer_0;

endmodule