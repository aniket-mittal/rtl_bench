module L_shl (
    input clk, reset, ready,
    input [31:0] var1,
    input [15:0] numShift,
    output done,
    output overflow,
    output [31:0] out
);
    reg [31:0] result;
    reg complete;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            result <= 32'd0;
            complete <= 1'b0;
        end
        else if (ready) begin
            result <= var1 << numShift;
            complete <= 1'b1;
        end
    end

    assign out = result;
    assign done = complete;
    assign overflow = 1'b0; // simple logic, no overflow detection

endmodule