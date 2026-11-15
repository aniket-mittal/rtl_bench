module origen_141857 (
    input wire clk,
    input wire rst,
    input wire [7:0] A,
    input wire [7:0] B,
    input wire CIN,
    input wire SUB,
    output reg [7:0] SUM,
    output reg OVF
);

    // Pipeline registers
    reg [7:0] A_reg, B_reg;
    reg CIN_reg, SUB_reg;
    reg [8:0] result_reg;

    // First stage: Register inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A_reg <= 8'b0;
            B_reg <= 8'b0;
            CIN_reg <= 1'b0;
            SUB_reg <= 1'b0;
        end else begin
            A_reg <= A;
            B_reg <= B;
            CIN_reg <= CIN;
            SUB_reg <= SUB;
        end
    end

    // Second stage: Perform addition or subtraction
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result_reg <= 9'b0;
        end else begin
            if (SUB_reg)
                result_reg <= {1'b0, A_reg} - {1'b0, B_reg} - {8'b0, CIN_reg};
            else
                result_reg <= {1'b0, A_reg} + {1'b0, B_reg} + {8'b0, CIN_reg};
        end
    end

    // Third stage: Set output and overflow
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            SUM <= 8'b0;
            OVF <= 1'b0;
        end else begin
            SUM <= result_reg[7:0];
            OVF <= result_reg[8];
        end
    end

endmodule