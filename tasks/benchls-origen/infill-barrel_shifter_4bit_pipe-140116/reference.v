module origen_140116 (
    input wire clk,
    input wire rst,
    input wire [3:0] A,
    input wire signed [3:0] B,
    output reg [3:0] Q
);

    reg [3:0] stage1_A, stage1_B;
    reg [3:0] stage2_A;
    reg [2:0] stage2_shift;
    reg stage2_direction;

    // Stage 1: Input Registration
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage1_A <= 4'b0;
            stage1_B <= 4'b0;
        end else begin
            stage1_A <= A;
            stage1_B <= B;
        end
    end

    // Stage 2: Shift Amount and Direction Calculation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage2_A <= 4'b0;
            stage2_shift <= 3'b0;
            stage2_direction <= 1'b0;
        end else begin
            stage2_A <= stage1_A;
            stage2_shift <= (stage1_B[3] ? -stage1_B[2:0] : stage1_B[2:0]);
            stage2_direction <= ~stage1_B[3];
        end
    end

    // Stage 3: Barrel Shifting
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 4'b0;
        end else begin
            if (stage2_direction) begin
                // Left shift
                Q <= stage2_A << stage2_shift;
            end else begin
                // Right shift
                Q <= stage2_A >> stage2_shift;
            end
        end
    end

endmodule