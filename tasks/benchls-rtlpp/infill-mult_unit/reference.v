module mult_unit (
    input       aclr0,
    input       clock0,
    input [15:0] dataa,
    input [15:0] datab,
    input       ena0,
    output [31:0] result
);

    reg [31:0] result_reg;

    always @(posedge clock0 or posedge aclr0) begin
        if (aclr0) begin
            result_reg <= 32'd0;
        end else if (ena0) begin
            result_reg <= dataa * datab;
        end
    end

    assign result = result_reg;

endmodule