module origen_110481 (
    input wire ref_clk,
    input wire rst,
    input wire cpu_clk,
    input wire [2:0] n,
    input wire LdCnt,
    input wire counten,
    output reg kcalc,
    output reg tff_out,
    output wire cout,
    output wire [7:0] k
);

    reg [7:0] duration;
    reg old_cpu_clk;
    reg [7:0] cnt;

    wire rising_edge = cpu_clk && !old_cpu_clk;
    wire falling_edge = !cpu_clk && old_cpu_clk;

    assign k = (duration << 1) >> n;
    assign cout = (cnt == 8'hFF);

    always @(posedge ref_clk or posedge rst) begin
        if (rst) begin
            duration <= 8'd0;
            old_cpu_clk <= 1'b0;
            kcalc <= 1'b0;
            cnt <= 8'd0;
            tff_out <= 1'b0;
        end else begin
            old_cpu_clk <= cpu_clk;

            if (cpu_clk) begin
                duration <= duration + 8'd1;
            end

            if (rising_edge) begin
                duration <= 8'd1;
                kcalc <= 1'b0;
            end

            if (falling_edge) begin
                kcalc <= 1'b1;
            end

            if (LdCnt) begin
                cnt <= 8'd255 - (k >> 1);
            end else if (counten) begin
                cnt <= cnt + 8'd1;
            end

            if (cout) begin
                tff_out <= ~tff_out;
            end
        end
    end

endmodule