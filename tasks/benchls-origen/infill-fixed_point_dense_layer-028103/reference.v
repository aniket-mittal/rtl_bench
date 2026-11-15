module origen_028103 (
    input wire clk,
    input wire rst_n,
    input wire [63:0] d2_input,
    output reg [31:0] d2_output
);

    reg [15:0] d2_input_r [3:0];
    reg signed [31:0] temp_mult [7:0];
    reg signed [31:0] temp_add [1:0];

    wire signed [15:0] weight [7:0];
    wire signed [15:0] bias [1:0];

    assign weight[0] = 16'h0400;
    assign weight[1] = 16'hFC00;
    assign weight[2] = 16'h0200;
    assign weight[3] = 16'h0100;
    assign weight[4] = 16'hFE00;
    assign weight[5] = 16'h0300;
    assign weight[6] = 16'hFD00;
    assign weight[7] = 16'h0500;

    assign bias[0] = 16'h0080;
    assign bias[1] = 16'hFF80;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            d2_input_r[0] <= 16'h0000;
            d2_input_r[1] <= 16'h0000;
            d2_input_r[2] <= 16'h0000;
            d2_input_r[3] <= 16'h0000;
            d2_output <= 32'h00000000;
        end else begin
            d2_input_r[0] <= d2_input[15:0];
            d2_input_r[1] <= d2_input[31:16];
            d2_input_r[2] <= d2_input[47:32];
            d2_input_r[3] <= d2_input[63:48];
            d2_output[15:0] <= temp_add[0][30:15] + bias[0];
            d2_output[31:16] <= temp_add[1][30:15] + bias[1];
        end
    end

    always @(*) begin
        temp_mult[0] = $signed(d2_input_r[0]) * $signed(weight[0]);
        temp_mult[1] = $signed(d2_input_r[1]) * $signed(weight[1]);
        temp_mult[2] = $signed(d2_input_r[2]) * $signed(weight[2]);
        temp_mult[3] = $signed(d2_input_r[3]) * $signed(weight[3]);
        temp_mult[4] = $signed(d2_input_r[0]) * $signed(weight[4]);
        temp_mult[5] = $signed(d2_input_r[1]) * $signed(weight[5]);
        temp_mult[6] = $signed(d2_input_r[2]) * $signed(weight[6]);
        temp_mult[7] = $signed(d2_input_r[3]) * $signed(weight[7]);

        temp_add[0] = temp_mult[0][30:15] + temp_mult[1][30:15] + temp_mult[2][30:15] + temp_mult[3][30:15];
        temp_add[1] = temp_mult[4][30:15] + temp_mult[5][30:15] + temp_mult[6][30:15] + temp_mult[7][30:15];
    end

endmodule