module origen_142921 (
    input wire clk,
    input wire rst,
    input wire [3:0] DATA,
    input wire [1:0] SHIFT,
    output reg [3:0] RESULT
);

    reg [3:0] stage1_data;
    reg [1:0] stage1_shift;
    reg [3:0] stage2_data;
    reg [1:0] stage2_shift;

    // Stage 1: Register inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage1_data <= 4'b0;
            stage1_shift <= 2'b0;
        end else begin
            stage1_data <= DATA;
            stage1_shift <= SHIFT;
        end
    end

    // Stage 2: Perform first level of shifting
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage2_data <= 4'b0;
            stage2_shift <= 2'b0;
        end else begin
            stage2_shift <= stage1_shift;
            if (stage1_shift[0]) begin
                stage2_data <= {stage1_data[0], stage1_data[3:1]};
            end else begin
                stage2_data <= stage1_data;
            end
        end
    end

    // Stage 3: Perform second level of shifting and output result
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            RESULT <= 4'b0;
        end else begin
            if (stage2_shift[1]) begin
                RESULT <= {stage2_data[1:0], stage2_data[3:2]};
            end else begin
                RESULT <= stage2_data;
            end
        end
    end

endmodule