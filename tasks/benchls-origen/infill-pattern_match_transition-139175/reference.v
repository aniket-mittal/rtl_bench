module origen_139175(
    input wire clk,
    input wire rst,
    input wire [31:0] input_vector1,
    input wire [31:0] input_vector2,
    output wire result
);

    wire transition_detected;
    wire [7:0] comparison_results;
    wire [31:0] pattern = 32'h0000FFFF;

    // Instantiate the transition detector
    transition_detector td (
        .clk(clk),
        .rst(rst),
        .input_signal(input_vector1[0]),
        .transition_detected(transition_detected)
    );

    // Instantiate 8 4-bit comparators
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : comp_gen
            comparator_4bit comp (
                .a(input_vector1[i*4+3:i*4]),
                .b(input_vector2[i*4+3:i*4]),
                .equal(comparison_results[i])
            );
        end
    endgenerate

    // Functional module to check pattern and generate output
    pattern_checker pc (
        .clk(clk),
        .rst(rst),
        .transition_detected(transition_detected),
        .comparison_results(comparison_results),
        .input_vector(input_vector1),
        .pattern(pattern),
        .result(result)
    );

endmodule

module transition_detector(
    input wire clk,
    input wire rst,
    input wire input_signal,
    output reg transition_detected
);

    reg prev_signal;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_signal <= 1'b0;
            transition_detected <= 1'b0;
        end else begin
            prev_signal <= input_signal;
            transition_detected <= (prev_signal == 1'b1 && input_signal == 1'b0);
        end
    end

endmodule

module comparator_4bit(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire equal
);

    assign equal = (a == b);

endmodule

module pattern_checker(
    input wire clk,
    input wire rst,
    input wire transition_detected,
    input wire [7:0] comparison_results,
    input wire [31:0] input_vector,
    input wire [31:0] pattern,
    output reg result
);

    reg [2:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 1'b0;
            counter <= 3'b000;
        end else if (transition_detected) begin
            counter <= 3'b000;
            result <= 1'b0;
        end else if (counter == 3'b111) begin
            result <= (&comparison_results) & (input_vector == {pattern, pattern});
        end else begin
            counter <= counter + 1'b1;
        end
    end

endmodule