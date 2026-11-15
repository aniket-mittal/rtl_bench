module pcmodule (
    input [0:15] in,
    input load,
    input inc,
    input reset,
    input clk,
    output reg [0:15] out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 16'b0;
        else if (load)
            out <= in;
        else if (inc)
        out <= out + 1;
    end
endmodule