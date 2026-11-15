module origen_140539(
    input [7:0] a,
    input [7:0] b,
    input add_sub,
    input select,
    output [7:0] max_value,
    output max_source
);

    wire [7:0] addsub_result;
    wire addsub_cout;
    wire [1:0] comp_result;
    wire [7:0] comp_max;
    wire addsub_enable, comp_enable;

    // Control logic
    assign addsub_enable = ~select;
    assign comp_enable = select;

    // 8-bit adder/subtractor
    adder_subtractor addsub (
        .a(a),
        .b(b),
        .add_sub(add_sub),
        .enable(addsub_enable),
        .result(addsub_result),
        .cout(addsub_cout)
    );

    // 4-bit comparator (extended to 8-bit)
    comparator comp (
        .a(a[3:0]),
        .b(b[3:0]),
        .enable(comp_enable),
        .result(comp_result)
    );

    // Determine max value from comparator
    assign comp_max = (comp_result[1]) ? a : b;

    // Functional module to determine overall max value
    max_selector max_sel (
        .addsub_result(addsub_result),
        .comp_max(comp_max),
        .select(select),
        .max_value(max_value),
        .max_source(max_source)
    );

endmodule

module adder_subtractor(
    input [7:0] a,
    input [7:0] b,
    input add_sub,
    input enable,
    output [7:0] result,
    output cout
);
    wire [7:0] b_mod;
    wire [8:0] sum;

    assign b_mod = add_sub ? ~b : b;
    assign sum = enable ? (a + b_mod + add_sub) : 9'b0;
    assign result = sum[7:0];
    assign cout = sum[8];
endmodule

module comparator(
    input [3:0] a,
    input [3:0] b,
    input enable,
    output reg [1:0] result
);
    always @(*) begin
        if (enable) begin
            if (a > b)
                result = 2'b10;
            else if (a < b)
                result = 2'b01;
            else
                result = 2'b00;
        end else begin
            result = 2'b00;
        end
    end
endmodule

module max_selector(
    input [7:0] addsub_result,
    input [7:0] comp_max,
    input select,
    output [7:0] max_value,
    output max_source
);
    assign max_value = (select) ? comp_max : addsub_result;
    assign max_source = select;
endmodule