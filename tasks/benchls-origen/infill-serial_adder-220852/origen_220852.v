module origen_220852(
    input clk,
    input en_i,
    input ina,
    input inb,
    output reg en_o,
    output reg [1:0] out
);

    reg [1:0] counter;
    reg [1:0] state;
    reg [1:0] temp_a, temp_b;
    reg [1:0] temp_out;

    initial begin
        counter = 2'b00;
        state = 2'b00;
        temp_a = 2'b00;
        temp_b = 2'b00;
        temp_out = 2'b00;
        out = 2'b00;
        en_o = 1'b0;
    end

    [MASKED]

endmodule