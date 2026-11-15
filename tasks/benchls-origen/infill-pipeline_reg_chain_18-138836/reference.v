module origen_138836 (
    input wire clk,
    input wire clk_ena,
    input wire [7:0] in_stream,
    input wire reset,
    output reg [7:0] pipeline_reg_0,
    output reg [7:0] pipeline_reg_1,
    output reg [7:0] pipeline_reg_2,
    output reg [7:0] pipeline_reg_3,
    output reg [7:0] pipeline_reg_4,
    output reg [7:0] pipeline_reg_5,
    output reg [7:0] pipeline_reg_6,
    output reg [7:0] pipeline_reg_7,
    output reg [7:0] pipeline_reg_8,
    output reg [7:0] pipeline_reg_9,
    output reg [7:0] pipeline_reg_10,
    output reg [7:0] pipeline_reg_11,
    output reg [7:0] pipeline_reg_12,
    output reg [7:0] pipeline_reg_13,
    output reg [7:0] pipeline_reg_14,
    output reg [7:0] pipeline_reg_15,
    output reg [7:0] pipeline_reg_16,
    output reg [7:0] pipeline_reg_17
);

always @(posedge clk) begin
    if (reset) begin
        pipeline_reg_0 <= 8'b0;
        pipeline_reg_1 <= 8'b0;
        pipeline_reg_2 <= 8'b0;
        pipeline_reg_3 <= 8'b0;
        pipeline_reg_4 <= 8'b0;
        pipeline_reg_5 <= 8'b0;
        pipeline_reg_6 <= 8'b0;
        pipeline_reg_7 <= 8'b0;
        pipeline_reg_8 <= 8'b0;
        pipeline_reg_9 <= 8'b0;
        pipeline_reg_10 <= 8'b0;
        pipeline_reg_11 <= 8'b0;
        pipeline_reg_12 <= 8'b0;
        pipeline_reg_13 <= 8'b0;
        pipeline_reg_14 <= 8'b0;
        pipeline_reg_15 <= 8'b0;
        pipeline_reg_16 <= 8'b0;
        pipeline_reg_17 <= 8'b0;
    end else if (clk_ena) begin
        pipeline_reg_17 <= pipeline_reg_16;
        pipeline_reg_16 <= pipeline_reg_15;
        pipeline_reg_15 <= pipeline_reg_14;
        pipeline_reg_14 <= pipeline_reg_13;
        pipeline_reg_13 <= pipeline_reg_12;
        pipeline_reg_12 <= pipeline_reg_11;
        pipeline_reg_11 <= pipeline_reg_10;
        pipeline_reg_10 <= pipeline_reg_9;
        pipeline_reg_9 <= pipeline_reg_8;
        pipeline_reg_8 <= pipeline_reg_7;
        pipeline_reg_7 <= pipeline_reg_6;
        pipeline_reg_6 <= pipeline_reg_5;
        pipeline_reg_5 <= pipeline_reg_4;
        pipeline_reg_4 <= pipeline_reg_3;
        pipeline_reg_3 <= pipeline_reg_2;
        pipeline_reg_2 <= pipeline_reg_1;
        pipeline_reg_1 <= pipeline_reg_0;
        pipeline_reg_0 <= in_stream;
    end
end

endmodule

// Testbench
