module origen_114068 #(
    parameter GMT = 3,
    parameter START_POSIX_TIME = 0,
    parameter CLK_FREQ = 50
) (
    input wire clk_i,
    input wire rst_i,
    input wire [31:0] user_posix_time_i,
    input wire user_posix_time_en_i,
    output reg [31:0] posix_time_o,
    output reg new_posix_time_o,
    output reg last_tact_o
);

    localparam TACTS_PER_SECOND = CLK_FREQ * 1000000;

    reg [31:0] posix_time_cnt;
    reg [31:0] tacts_cnt;
    reg user_posix_time_en_r;

    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            posix_time_cnt <= START_POSIX_TIME;
            tacts_cnt <= 0;
            last_tact_o <= 0;
        end else begin
            if (user_posix_time_en_i && !user_posix_time_en_r) begin
                posix_time_cnt <= (GMT >= 0) ? user_posix_time_i + GMT * 3600 : user_posix_time_i - (-GMT) * 3600;
                tacts_cnt <= 0;
                last_tact_o <= 0;
            end else if (tacts_cnt == TACTS_PER_SECOND - 1) begin
                posix_time_cnt <= posix_time_cnt + 1;
                tacts_cnt <= 0;
                last_tact_o <= 1;
            end else begin
                tacts_cnt <= tacts_cnt + 1;
                last_tact_o <= (tacts_cnt == TACTS_PER_SECOND - 2);
            end
        end
    end

    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            user_posix_time_en_r <= 0;
            new_posix_time_o <= 0;
        end else begin
            user_posix_time_en_r <= user_posix_time_en_i;
            new_posix_time_o <= user_posix_time_en_i && !user_posix_time_en_r;
        end
    end

    always @(posedge clk_i) begin
        posix_time_o <= posix_time_cnt;
    end

endmodule