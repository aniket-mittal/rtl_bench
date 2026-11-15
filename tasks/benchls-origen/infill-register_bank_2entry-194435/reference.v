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

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            integer i;
            for (i = 0; i < Tamrow; i = i + 1) begin
                banco_reg[i] <= {Tamdata{1'b0}};
            end
            posicion <= 2'b00;
            pos_A <= 2'b00;
            pos_B <= 2'b00;
            done_reg <= 1'b0;
        end else if (init) begin
            posicion <= instr[7:6];
            pos_A <= instr[5:4];
            pos_B <= instr[3:2];
        end else if (rd) begin
            banco_reg[posicion] <= data_result;
            done_reg <= 1'b1;
        end else begin
            done_reg <= 1'b0;
        end
    end

    assign data_A = banco_reg[pos_A];
    assign data_B = banco_reg[pos_B];
    assign done = done_reg;

endmodule