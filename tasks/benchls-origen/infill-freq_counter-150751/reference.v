module origen_150751(
    input clk,
    input rst_n,
    input sig_in,
    output reg [31:0] pinlv
);

    parameter F_1S = 50000000; // Assume 50MHz clock

    reg sig_in_buffer, sig_in_buffer1;
    reg start_cnt_neg;
    reg [31:0] fgate_cnt;
    reg fgate;
    reg start_cnt;
    reg [31:0] fx_cnt_temp;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sig_in_buffer <= 1'b0;
            sig_in_buffer1 <= 1'b0;
            start_cnt_neg <= 1'b0;
            fgate_cnt <= 32'b0;
            fgate <= 1'b0;
            start_cnt <= 1'b0;
            fx_cnt_temp <= 32'b0;
            pinlv <= 32'b0;
        end
        else begin
            sig_in_buffer <= sig_in;
            sig_in_buffer1 <= sig_in_buffer;
            start_cnt_neg <= (sig_in_buffer && !sig_in_buffer1);
            if (fgate_cnt < F_1S) begin
                fgate_cnt <= fgate_cnt + 1;
                fgate <= 1'b1;
            end
            else begin
                fgate_cnt <= 32'b0;
                fgate <= 1'b0;
            end
            if (start_cnt_neg && fgate) begin
                start_cnt <= 1'b1;
                fx_cnt_temp <= 32'b0;
            end
            else if (!fgate) begin
                start_cnt <= 1'b0;
                pinlv <= fx_cnt_temp;
            end
            else begin
                fx_cnt_temp <= fx_cnt_temp + 1;
            end
        end
    end

endmodule