module origen_060065 (
    input wire clk_50M,
    input wire rst,
    input wire [27:0] bin,
    input wire [6:0] duty_bin,
    output reg [31:0] number,
    output reg [7:0] duty_number
);

reg [63:0] temp_bin;
reg [18:0] temp_duty_bin;
integer i;

always @(posedge clk_50M or negedge rst) begin
    if (!rst) begin
        number <= 32'd0;
        duty_number <= 8'd0;
        temp_bin <= 64'd0;
        temp_duty_bin <= 19'd0;
    end else if (bin == 28'd0 && duty_bin == 7'd0) begin
        number <= 32'd0;
        duty_number <= 8'd0;
    end else begin
        // Convert 28-bit binary to decimal
        temp_bin <= {36'd0, bin};
        for (i = 0; i < 28; i = i + 1) begin
            if (temp_bin[31:28] > 4) temp_bin[31:28] <= temp_bin[31:28] + 3;
            if (temp_bin[35:32] > 4) temp_bin[35:32] <= temp_bin[35:32] + 3;
            if (temp_bin[39:36] > 4) temp_bin[39:36] <= temp_bin[39:36] + 3;
            if (temp_bin[43:40] > 4) temp_bin[43:40] <= temp_bin[43:40] + 3;
            if (temp_bin[47:44] > 4) temp_bin[47:44] <= temp_bin[47:44] + 3;
            if (temp_bin[51:48] > 4) temp_bin[51:48] <= temp_bin[51:48] + 3;
            if (temp_bin[55:52] > 4) temp_bin[55:52] <= temp_bin[55:52] + 3;
            if (temp_bin[59:56] > 4) temp_bin[59:56] <= temp_bin[59:56] + 3;
            if (temp_bin[63:60] > 4) temp_bin[63:60] <= temp_bin[63:60] + 3;
            temp_bin <= {temp_bin[62:0], 1'b0};
        end
        number <= temp_bin[59:28];

        // Convert 7-bit duty cycle to decimal
        temp_duty_bin <= {12'd0, duty_bin};
        for (i = 0; i < 7; i = i + 1) begin
            if (temp_duty_bin[10:7] > 4) temp_duty_bin[10:7] <= temp_duty_bin[10:7] + 3;
            if (temp_duty_bin[14:11] > 4) temp_duty_bin[14:11] <= temp_duty_bin[14:11] + 3;
            if (temp_duty_bin[18:15] > 4) temp_duty_bin[18:15] <= temp_duty_bin[18:15] + 3;
            temp_duty_bin <= {temp_duty_bin[17:0], 1'b0};
        end
        duty_number <= temp_duty_bin[14:7];
    end
end

endmodule