module origen_015360 (
    input wire clk,
    input wire reset,
    input wire enb,
    input wire [7:0] min_Index,
    input wire [7:0] Index,
    output wire Out1
);

    reg signed [8:0] subtraction_result;
    reg signed [8:0] delay_reg1;
    reg [8:0] abs_value;
    reg [8:0] delay_reg2;
    reg out_reg;

    // Subtractor
    always @(posedge clk or posedge reset) begin
        if (reset)
            subtraction_result <= 9'b0;
        else if (enb)
            subtraction_result <= $signed({1'b0, min_Index}) - $signed({1'b0, Index});
    end

    // First Delay Register
    always @(posedge clk or posedge reset) begin
        if (reset)
            delay_reg1 <= 9'b0;
        else if (enb)
            delay_reg1 <= subtraction_result;
    end

    // Absolute Value Calculator
    always @(posedge clk or posedge reset) begin
        if (reset)
            abs_value <= 9'b0;
        else if (enb)
            abs_value <= (delay_reg1[8]) ? -delay_reg1 : delay_reg1;
    end

    // Second Delay Register
    always @(posedge clk or posedge reset) begin
        if (reset)
            delay_reg2 <= 9'b0;
        else if (enb)
            delay_reg2 <= abs_value;
    end

    // Comparator and Output Register
    always @(posedge clk or posedge reset) begin
        if (reset)
            out_reg <= 1'b0;
        else if (enb)
            out_reg <= (delay_reg2 > 9'd1);
    end

    assign Out1 = out_reg;

endmodule