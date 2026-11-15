module origen_182420 #(
    parameter integer simulate = 0
)(
    input wire clk,
    input wire reset,
    input wire left_fwd,
    input wire left_rev,
    input wire right_fwd,
    input wire right_rev,
    output reg [7:0] left_pos,
    output reg [7:0] right_pos
);

    localparam integer rojobot_cnt = (simulate == 0) ? 9999999 : 49999;
    reg [25:0] ck_count;
    reg tick5hz;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ck_count <= 0;
            tick5hz <= 0;
        end else begin
            ck_count <= ck_count + 1;
            if (ck_count == rojobot_cnt) begin
                ck_count <= 0;
                tick5hz <= 1;
            end else begin
                tick5hz <= 0;
            end
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            left_pos <= 0;
            right_pos <= 0;
        end else begin
            if (tick5hz) begin
                if (left_fwd && !left_rev) begin
                    left_pos <= left_pos + 1;
                end else if (!left_fwd && left_rev) begin
                    left_pos <= left_pos - 1;
                end
                if (right_fwd && !right_rev) begin
                    right_pos <= right_pos + 1;
                end else if (!right_fwd && right_rev) begin
                    right_pos <= right_pos - 1;
                end
            end
        end
    end

endmodule