module origen_129583(
    input [15:0] a16, b16,
    input [7:0] a8, b8,
    input size_select,
    output final_result
);

    wire eq16, gt16, lt16;
    wire eq8, gt8, lt8;
    wire eq_all;
    wire comparator_enable;

    // 16-bit comparator
    comparator16 comp16 (
        .a(a16),
        .b(b16),
        .eq(eq16),
        .gt(gt16),
        .lt(lt16),
        .enable(comparator_enable)
    );

    // 8-bit comparator
    comparator8 comp8 (
        .a(a8),
        .b(b8),
        .eq(eq8),
        .gt(gt8),
        .lt(lt8),
        .enable(!comparator_enable)
    );

    // Control logic module
    control_logic ctrl (
        .size_select(size_select),
        .comparator_enable(comparator_enable)
    );

    // Final functional module
    final_compare final_comp (
        .eq16(eq16),
        .eq8(eq8),
        .size_select(size_select),
        .eq_all(eq_all)
    );

    assign final_result = eq_all;

endmodule

module comparator16(
    input [15:0] a, b,
    input enable,
    output reg eq, gt, lt
);
    always @(*) begin
        if (enable) begin
            eq = (a == b);
            gt = (a > b);
            lt = (a < b);
        end else begin
            eq = 1'b0;
            gt = 1'b0;
            lt = 1'b0;
        end
    end
endmodule

module comparator8(
    input [7:0] a, b,
    input enable,
    output reg eq, gt, lt
);
    always @(*) begin
        if (enable) begin
            eq = (a == b);
            gt = (a > b);
            lt = (a < b);
        end else begin
            eq = 1'b0;
            gt = 1'b0;
            lt = 1'b0;
        end
    end
endmodule

module control_logic(
    input size_select,
    output comparator_enable
);
    assign comparator_enable = size_select;
endmodule

module final_compare(
    input eq16, eq8, size_select,
    output eq_all
);
    assign eq_all = size_select ? eq16 : eq8;
endmodule