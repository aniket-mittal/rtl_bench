module rtlpp_04057 (
    input wire clk,
    input wire reset,
    input wire [1:0] select,
    input wire [3:0] in0,
    input wire [3:0] in1,
    input wire [3:0] in2,
    input wire [3:0] in3,
    input wire in0_valid,
    input wire in1_valid,
    input wire in2_valid,
    input wire in3_valid,
    output reg [3:0] out_b,
    output reg out_valid_b
);

reg [3:0] out_1_mux, out_2_mux;
reg valid_1_mux, valid_2_mux;

// Internal 2:1 MUX
always @(*) begin
    if (reset) begin
        out_1_mux = 4'b0;
        valid_1_mux = 1'b0;
    end else begin
        if (select[0] == 1'b0) begin
            out_1_mux = in0;
            valid_1_mux = in0_valid;
        end else begin
            out_1_mux = in1;
            valid_1_mux = in1_valid;
        end
    end
end

always @(*) begin
    if (reset) begin
        out_2_mux = 4'b0;
        valid_2_mux = 1'b0;
    end else begin
        if (select[0] == 1'b0) begin
            out_2_mux = in2;
            valid_2_mux = in2_valid;
        end else begin
            out_2_mux = in3;
            valid_2_mux = in3_valid;
        end
    end
end

always @(*) begin
    if (reset) begin
        out_b = 4'b0;
        out_valid_b = 1'b0;
    end else begin
        if (select[1] == 1'b0) begin
            out_b = out_1_mux;
            out_valid_b = valid_1_mux;
        end else begin
            out_b = out_2_mux;
            out_valid_b = valid_2_mux;
        end
    end
end

endmodule