module origen_021155 (
    input wire clk,
    input wire reset,
    input wire buy,
    input wire [1:0] product,
    input wire [7:0] credit,
    output reg apple,
    output reg banana,
    output reg carrot,
    output reg date,
    output reg error
);

    [MASKED]

    initial begin
        apple = 1'b0;
        banana = 1'b0;
        carrot = 1'b0;
        date = 1'b0;
        error = 1'b0;
    end

endmodule