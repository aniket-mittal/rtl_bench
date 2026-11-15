module rtlpp_00088 (
    input clock,
    input res,
    output reg [4:0] counter_out,
    output reg [13:0] sin_out
);

always @(posedge res) begin
    counter_out <= 5'b00000;
    sin_out <= 14'b00000_00000_0000;
end

[MASKED]

endmodule