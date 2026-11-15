module origen_203412 (
    input clk,
    input rst,
    output reg [7:0] out,
    output reg we,
    output reg rst_out
);

    reg [26:0] slow_clk;
    reg [4:0] countsec;
    reg [7:0] out_r;
    reg en;
    reg [3:0] cnt;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            slow_clk <= 0;
            countsec <= 0;
            out_r <= 9;
            en <= 0;
            cnt <= 0;
            we <= 0;
            rst_out <= 1;
        end
        else begin
            slow_clk <= slow_clk + 1;
            if (slow_clk == 60) begin
                slow_clk <= 0;
                en <= 1;
                countsec <= countsec + 1;
                if (countsec == 9) begin
                    countsec <= 0;
                end
                out_r <= 9 - countsec;
                we <= 1;
                cnt <= 0;
            end
            else begin
                en <= 0;
                cnt <= cnt + 1;
                out <= out_r[0];
                out_r <= out_r >> 1;
                if (cnt == 8) begin
                    we <= 0;
                end
            end
            rst_out <= 0;
        end
    end

endmodule