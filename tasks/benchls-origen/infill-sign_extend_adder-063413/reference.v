module origen_063413 #(
    parameter width_a = 8,
    parameter width_b = 8,
    parameter [8*5:1] dataa_signed = "false",
    parameter [8*5:1] datab_signed = "false",
    parameter [8*8:1] adder_mode = "use_port",
    parameter width_sum = (width_a > width_b) ? width_a + 1 : width_b + 1
) (
    input [width_a-1:0] dataa,
    input [width_b-1:0] datab,
    input signa,
    input signb,
    input addsub,
    output [width_sum-1:0] sum,
    output sumsign
);

    reg [width_sum-1:0] extended_a, extended_b;
    reg operation;
    wire [width_sum:0] result;

    // Input sign extension
    always @(*) begin
        case (dataa_signed)
            "use_port": extended_a = {{(width_sum-width_a){signa}}, dataa};
            "true":     extended_a = {{(width_sum-width_a){dataa[width_a-1]}}, dataa};
            default:    extended_a = {{(width_sum-width_a){1'b0}}, dataa};
        endcase

        case (datab_signed)
            "use_port": extended_b = {{(width_sum-width_b){signb}}, datab};
            "true":     extended_b = {{(width_sum-width_b){datab[width_b-1]}}, datab};
            default:    extended_b = {{(width_sum-width_b){1'b0}}, datab};
        endcase
    end

    // Operation selection
    always @(*) begin
        case (adder_mode)
            "use_port": operation = addsub;
            "add":      operation = 1'b1;
            "sub":      operation = 1'b0;
            default:    operation = 1'b1;
        endcase
    end

    // Result calculation
    assign result = operation ? {1'b0, extended_a} + {1'b0, extended_b} :
                                {1'b0, extended_a} - {1'b0, extended_b};

    // Output assignment
    assign sum = result[width_sum-1:0];
    assign sumsign = result[width_sum];

endmodule