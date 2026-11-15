module origen_126773 (
    input wire clk,
    input wire rst_n,
    input wire D3, D2, D1, D0,
    output reg Y1, Y0
);

    reg stage1_D3, stage1_D2, stage1_D1;
    reg stage2_Y1, stage2_Y0;

    // Stage 1: Register inputs
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stage1_D3 <= 1'b0;
            stage1_D2 <= 1'b0;
            stage1_D1 <= 1'b0;
        end else begin
            stage1_D3 <= D3;
            stage1_D2 <= D2;
            stage1_D1 <= D1;
        end
    end

    // Stage 2: Perform priority encoding
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stage2_Y1 <= 1'b0;
            stage2_Y0 <= 1'b0;
        end else begin
            stage2_Y1 <= stage1_D3;
            if (stage1_D3)
                stage2_Y0 <= 1'b1;
            else if (stage1_D2)
                stage2_Y0 <= 1'b1;
            else if (stage1_D1)
                stage2_Y0 <= 1'b0;
            else
                stage2_Y0 <= 1'b0;
        end
    end

    // Stage 3: Register outputs
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            Y1 <= 1'b0;
            Y0 <= 1'b0;
        end else begin
            Y1 <= stage2_Y1;
            Y0 <= stage2_Y0;
        end
    end

endmodule