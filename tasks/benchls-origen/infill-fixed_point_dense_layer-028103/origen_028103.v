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

    [MASKED]

endmodule