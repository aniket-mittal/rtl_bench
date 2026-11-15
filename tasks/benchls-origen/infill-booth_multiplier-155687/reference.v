module origen_155687(
    input clk,
    input initiate,
    input signed [31:0] multiplicand,
    input signed [31:0] multiplier,
    output reg done,
    output reg [6:0] count_add,
    output reg [6:0] count_sub,
    output reg signed [63:0] prod
);

reg [31:0] mult;
reg [31:0] mcand;
reg [5:0] count;
reg prev_bit;

always @(posedge clk) begin
    if (initiate) begin
        done <= 0;
        count_add <= 0;
        count_sub <= 0;
        prod <= 0;
        mult <= multiplier;
        mcand <= multiplicand;
        count <= 0;
        prev_bit <= 0;
    end
    else begin
        if (count < 32) begin
            if (mult[0] == 0 && prev_bit == 1) begin
                prod <= prod + mcand;
                count_add <= count_add + 1;
            end
            else if (mult[0] == 1 && prev_bit == 0) begin
                prod <= prod - mcand;
                count_sub <= count_sub + 1;
            end
            mult <= {mult[30:0], 1'b0};
            mcand <= {mcand[30:0], 1'b0};
            count <= count + 1;
            prev_bit <= mult[0];
        end
        else begin
            done <= 1;
        end
        if (mult == 0 || &mult == 1) begin
            done <= 1;
        end
    end
end

endmodule