module origen_194435 #(
    parameter Tamdata = 4,
    parameter Tamrow = 2
)(
    input clk,
    input reset,
    input [7:0] instr,
    input [Tamdata-1:0] data_result,
    input rd,
    input init,
    output [Tamdata-1:0] data_A,
    output [Tamdata-1:0] data_B,
    output done
);

    reg [Tamdata-1:0] banco_reg [Tamrow-1:0];
    reg [1:0] posicion, pos_A, pos_B;
    reg done_reg;

    initial begin
        integer i;
        for (i = 0; i < Tamrow; i = i + 1) begin
            banco_reg[i] = {Tamdata{1'b0}};
        end
    end

    [MASKED]

    assign data_A = banco_reg[pos_A];
    assign data_B = banco_reg[pos_B];
    assign done = done_reg;

endmodule