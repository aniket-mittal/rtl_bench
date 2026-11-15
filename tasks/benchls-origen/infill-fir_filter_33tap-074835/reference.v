module origen_074835 (
    input wire signed [15:0] sig_in,
    input wire clk,
    input wire rst,
    output reg signed [15:0] sig_out
);

    reg signed [15:0] taps [32:0];
    reg signed [31:0] sum;
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i <= 32; i = i + 1) begin
                taps[i] <= 16'b0;
            end
            sig_out <= 16'b0;
        end else begin
            // Shift taps
            for (i = 32; i > 0; i = i - 1) begin
                taps[i] <= taps[i-1];
            end
            taps[0] <= sig_in;

            // Calculate sum
            sum = 0;
            for (i = 0; i <= 32; i = i + 1) begin
                case(i)
                    0, 32: sum = sum + (taps[i] * 16'd2);
                    1, 31: sum = sum + (taps[i] * 16'd0);
                    2, 30: sum = sum - (taps[i] * 16'd10);
                    3, 29: sum = sum - (taps[i] * 16'd22);
                    4, 28: sum = sum - (taps[i] * 16'd33);
                    5, 27: sum = sum - (taps[i] * 16'd38);
                    6, 26: sum = sum - (taps[i] * 16'd33);
                    7, 25: sum = sum - (taps[i] * 16'd15);
                    8, 24: sum = sum + (taps[i] * 16'd17);
                    9, 23: sum = sum + (taps[i] * 16'd61);
                    10, 22: sum = sum + (taps[i] * 16'd116);
                    11, 21: sum = sum + (taps[i] * 16'd177);
                    12, 20: sum = sum + (taps[i] * 16'd240);
                    13, 19: sum = sum + (taps[i] * 16'd299);
                    14, 18: sum = sum + (taps[i] * 16'd349);
                    15, 17: sum = sum + (taps[i] * 16'd384);
                    16: sum = sum + (taps[i] * 16'd399);
                endcase
            end

            // Output calculation
            sig_out <= sum[31:16];
        end
    end

endmodule