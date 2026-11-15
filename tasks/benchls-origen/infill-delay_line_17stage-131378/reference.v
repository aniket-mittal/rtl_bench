module origen_131378 (
    input wire clk,
    input wire clk_ena,
    input wire in_stream,
    input wire reset,
    output wire pipeline_reg_0,
    output wire pipeline_reg_1,
    output wire pipeline_reg_2,
    output wire pipeline_reg_3,
    output wire pipeline_reg_4,
    output wire pipeline_reg_5,
    output wire pipeline_reg_6,
    output wire pipeline_reg_7,
    output wire pipeline_reg_8,
    output wire pipeline_reg_9,
    output wire pipeline_reg_10,
    output wire pipeline_reg_11,
    output wire pipeline_reg_12,
    output wire pipeline_reg_13,
    output wire pipeline_reg_14,
    output wire pipeline_reg_15,
    output wire pipeline_reg_16
);

    reg [16:0] pipeline;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pipeline <= 17'b0;
        end else if (clk_ena) begin
            pipeline <= {pipeline[15:0], in_stream};
        end
    end

    assign pipeline_reg_0 = pipeline[0];
    assign pipeline_reg_1 = pipeline[1];
    assign pipeline_reg_2 = pipeline[2];
    assign pipeline_reg_3 = pipeline[3];
    assign pipeline_reg_4 = pipeline[4];
    assign pipeline_reg_5 = pipeline[5];
    assign pipeline_reg_6 = pipeline[6];
    assign pipeline_reg_7 = pipeline[7];
    assign pipeline_reg_8 = pipeline[8];
    assign pipeline_reg_9 = pipeline[9];
    assign pipeline_reg_10 = pipeline[10];
    assign pipeline_reg_11 = pipeline[11];
    assign pipeline_reg_12 = pipeline[12];
    assign pipeline_reg_13 = pipeline[13];
    assign pipeline_reg_14 = pipeline[14];
    assign pipeline_reg_15 = pipeline[15];
    assign pipeline_reg_16 = pipeline[16];

endmodule