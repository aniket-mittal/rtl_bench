module origen_153358(
    input [3:0] s0,
    input [4:0] s1,
    input [5:0] s2, s3,
    input [5:0] random_no,
    input clk, enable,
    input r0, r1, r2, r3,
    output reg gr0, gr1, gr2, gr3
);

always @(posedge clk) begin
    if (enable) begin
        if (0 < random_no && random_no <= s0 && r0) begin
            gr0 <= 1;
            gr1 <= 0;
            gr2 <= 0;
            gr3 <= 0;
        end
        else if (s0 < random_no && random_no <= s1 && r1) begin
            gr0 <= 0;
            gr1 <= 1;
            gr2 <= 0;
            gr3 <= 0;
        end
        else if (s1 < random_no && random_no <= s2 && r2) begin
            gr0 <= 0;
            gr1 <= 0;
            gr2 <= 1;
            gr3 <= 0;
        end
        else if (s2 < random_no && random_no <= s3 && r3) begin
            gr0 <= 0;
            gr1 <= 0;
            gr2 <= 0;
            gr3 <= 1;
        end
        else begin
            gr0 <= gr0;
            gr1 <= gr1;
            gr2 <= gr2;
            gr3 <= gr3;
        end
    end
    else begin
        gr0 <= 0;
        gr1 <= 0;
        gr2 <= 0;
        gr3 <= 0;
    end
end

endmodule