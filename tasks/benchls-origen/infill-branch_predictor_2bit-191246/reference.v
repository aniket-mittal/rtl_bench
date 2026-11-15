module origen_191246 (
    input clk,
    input rst,
    input BranchTaken_i,
    input [31:0] WriteAddr_i,
    input [31:0] WriteTarget_i,
    input [31:0] ReadAddr_i,
    output reg [31:0] ReadTarget_o,
    output reg Hit_o
);

    reg [1:0] predict[0:31][0:1];
    reg [1:0] history;

    parameter S_NONTAKEN = 2'b00;
    parameter S_NEAR_NONTAKEN = 2'b01;
    parameter S_NEAR_TAKEN = 2'b10;
    parameter S_TAKEN = 2'b11;

    function [1:0] next_state;
        input [1:0] current_state;
        input branch_taken;
        begin
            case ({current_state, branch_taken})
                {S_NONTAKEN, 1'b0}: next_state = S_NONTAKEN;
                {S_NONTAKEN, 1'b1}: next_state = S_NEAR_TAKEN;
                {S_NEAR_NONTAKEN, 1'b0}: next_state = S_NONTAKEN;
                {S_NEAR_NONTAKEN, 1'b1}: next_state = S_NEAR_TAKEN;
                {S_NEAR_TAKEN, 1'b0}: next_state = S_NEAR_NONTAKEN;
                {S_NEAR_TAKEN, 1'b1}: next_state = S_TAKEN;
                {S_TAKEN, 1'b0}: next_state = S_NEAR_NONTAKEN;
                {S_TAKEN, 1'b1}: next_state = S_TAKEN;
            endcase
        end
    endfunction

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            history <= 2'b00;
            for (int i = 0; i < 32; i++) begin
                for (int j = 0; j < 2; j++) begin
                    predict[i][j] <= S_NONTAKEN;
                end
            end
        end else begin
            history <= {history[0], BranchTaken_i};
            predict[WriteAddr_i[4:0]][history] <= next_state(predict[WriteAddr_i[4:0]][history], BranchTaken_i);
            ReadTarget_o <= predict[ReadAddr_i[4:0]][history] == S_TAKEN || predict[ReadAddr_i[4:0]][history] == S_NEAR_TAKEN ? WriteTarget_i : ReadAddr_i + 4;
            Hit_o <= predict[ReadAddr_i[4:0]][history] == S_TAKEN || predict[ReadAddr_i[4:0]][history] == S_NEAR_TAKEN;
        end
    end

endmodule