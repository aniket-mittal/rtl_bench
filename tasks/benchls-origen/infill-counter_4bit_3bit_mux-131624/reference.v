module origen_131624 (
    input wire clk,
    input wire reset,
    input wire select,
    output wire [3:0] final_output
);

    wire [3:0] counter_4bit_out;
    wire [2:0] counter_3bit_out;
    wire [3:0] xor_out;

    // 4-bit binary counter
    counter_4bit c4 (
        .clk(clk),
        .reset(reset),
        .count(counter_4bit_out)
    );

    // 3-bit binary up counter
    counter_3bit c3 (
        .clk(clk),
        .reset(reset),
        .count(counter_3bit_out)
    );

    // XOR operation
    assign xor_out = {1'b0, counter_3bit_out} ^ counter_4bit_out;

    // 2-input multiplexer
    assign final_output = select ? counter_4bit_out : {1'b0, counter_3bit_out};

endmodule

module counter_4bit (
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else
            count <= count + 1'b1;
    end

endmodule

module counter_3bit (
    input wire clk,
    input wire reset,
    output reg [2:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 3'b000;
        else
            count <= count + 1'b1;
    end

endmodule