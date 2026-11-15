module origen_111251 (
    input wire clk,
    input wire rst,
    input wire p1_win,
    input wire p2_win,
    output reg [3:0] p1_score,
    output reg [3:0] p2_score,
    output reg done
);

    reg [2:0] pr_state, nx_state;
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

    reg [3:0] p1_score_reg, p2_score_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pr_state <= A;
            p1_score_reg <= 4'b0000;
            p2_score_reg <= 4'b0000;
        end else begin
            pr_state <= nx_state;
            p1_score_reg <= (nx_state == B) ? p1_score_reg + 1 : p1_score_reg;
            p2_score_reg <= (nx_state == C) ? p2_score_reg + 1 : p2_score_reg;
        end
    end

    [MASKED]

    always @(*) begin
        p1_score = p1_score_reg;
        p2_score = p2_score_reg;
    end

endmodule