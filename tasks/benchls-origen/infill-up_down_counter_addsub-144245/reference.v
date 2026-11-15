module origen_144245(
    input wire clk,
    input wire reset,
    input wire load,
    input wire up_down,
    input wire count_enable,
    input wire [3:0] data_in,
    input wire [3:0] add_sub_in,
    input wire add_sub_sel,
    output wire [3:0] final_out,
    output wire max_count
);

    wire [3:0] counter_out;
    wire [3:0] add_sub_out;

    // Instantiate the adder-subtractor module
    adder_subtractor as_module (
        .a(counter_out),
        .b(add_sub_in),
        .sel(add_sub_sel),
        .result(add_sub_out)
    );

    // Instantiate the counter module
    counter cnt_module (
        .clk(clk),
        .reset(reset),
        .load(load),
        .up_down(up_down),
        .count_enable(count_enable),
        .data_in(data_in),
        .add_sub_in(add_sub_out),
        .count_out(counter_out)
    );

    // Instantiate the functional module
    functional_module func_module (
        .counter_out(counter_out),
        .add_sub_out(add_sub_out),
        .count_enable(count_enable),
        .up_down(up_down),
        .final_out(final_out),
        .max_count(max_count)
    );

endmodule

module adder_subtractor(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire sel,
    output reg [3:0] result
);
    always @(*) begin
        if (sel)
            result = a - b;
        else
            result = a + b;
    end
endmodule

module counter(
    input wire clk,
    input wire reset,
    input wire load,
    input wire up_down,
    input wire count_enable,
    input wire [3:0] data_in,
    input wire [3:0] add_sub_in,
    output reg [3:0] count_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count_out <= 4'b0000;
        else if (load)
            count_out <= data_in;
        else if (count_enable)
            count_out <= add_sub_in;
    end
endmodule

module functional_module(
    input wire [3:0] counter_out,
    input wire [3:0] add_sub_out,
    input wire count_enable,
    input wire up_down,
    output reg [3:0] final_out,
    output reg max_count
);
    always @(*) begin
        if (count_enable) begin
            final_out = counter_out;
            if (up_down)
                max_count = (counter_out == 4'b1111);
            else
                max_count = (counter_out == 4'b0000);
        end else begin
            final_out = 4'b0000;
            max_count = 1'b0;
        end
    end
endmodule