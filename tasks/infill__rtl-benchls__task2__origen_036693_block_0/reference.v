module origen_036693 (
    input wire clk,
    input wire [31:0] EX_PC_IMM,
    input wire [31:0] EX_PC,
    input wire [3:0] EX_opcode,
    input wire EX_condFlag,
    input wire prediction,
    output reg correctOut,
    output reg update,
    output reg reset,
    output reg [31:0] newPC
);

    parameter BRANCH = 4'b1000;
    reg [1:0] correct;

    always @(posedge clk) begin
        if (EX_opcode == BRANCH) begin
            update <= 1'b1;
            
            if (EX_condFlag == prediction) begin
                correct <= 2'b10;
                reset <= 1'b0;
                newPC <= EX_PC + 32'd4;
            end
            else if (!EX_condFlag && prediction) begin
                correct <= 2'b00;
                reset <= 1'b1;
                newPC <= EX_PC;
            end
            else if (EX_condFlag && !prediction) begin
                correct <= 2'b01;
                reset <= 1'b1;
                newPC <= EX_PC_IMM;
            end
            else begin
                correct <= 2'b11;
                reset <= 1'b0;
                newPC <= EX_PC + 32'd4;
            end
        end
        else begin
            update <= 1'b0;
            reset <= 1'b0;
            correct <= 2'b00;
            newPC <= EX_PC + 32'd4;
        end
    end

    always @(*) begin
        correctOut = correct[1];
    end

endmodule