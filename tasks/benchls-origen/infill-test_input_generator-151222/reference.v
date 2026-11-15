module origen_151222 (
    output reg [5:0] data_in0,
    output reg [5:0] data_in1,
    output reg valid_in0,
    output reg valid_in1,
    output reg selector,
    output reg reset_L,
    input [5:0] data_in0_estr,
    input [5:0] data_in1_estr,
    input valid_in0_estr,
    input valid_in1_estr,
    input clk
);

    initial begin
        data_in0 = 6'b000000;
        data_in1 = 6'b000000;
        valid_in0 = 1'b0;
        valid_in1 = 1'b0;
        selector = 1'b0;
        reset_L = 1'b0;
    end

    always @(posedge clk) begin
        if (reset_L == 1'b0) begin
            reset_L <= 1'b1;
        end
        else begin
            data_in0 <= 6'b000011;
            data_in1 <= 6'b000010;
            valid_in0 <= 1'b1;
            valid_in1 <= 1'b1;
            selector <= 1'b0;
        end
    end

    always @(posedge clk) begin
        if (selector == 1'b0) begin
            data_in0 <= 6'b001100;
            data_in1 <= 6'b010101;
            selector <= 1'b1;
        end
        else begin
            data_in0 <= 6'b100010;
            data_in1 <= 6'b011111;
            selector <= 1'b0;
        end
    end

    assign data_in0_estr = data_in0;
    assign data_in1_estr = data_in1;
    assign valid_in0_estr = valid_in0;
    assign valid_in1_estr = valid_in1;

endmodule