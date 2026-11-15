module origen_139253 (
    input wire clk,
    input wire rst_n,
    input wire [31:0] data_in,
    input wire [4:0] shift_amount,
    input wire shift_left,
    output reg [31:0] shifted_out,
    output reg zero_flag
);

    // Pipeline registers
    reg [31:0] stage1_data;
    reg [4:0] stage1_shift_amount;
    reg stage1_shift_left;

    reg [31:0] stage2_shifted;

    // Stage 1: Register inputs
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stage1_data <= 32'b0;
            stage1_shift_amount <= 5'b0;
            stage1_shift_left <= 1'b0;
        end else begin
            stage1_data <= data_in;
            stage1_shift_amount <= shift_amount;
            stage1_shift_left <= shift_left;
        end
    end

    // Stage 2: Perform shift operation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stage2_shifted <= 32'b0;
        end else begin
            if (stage1_shift_left)
                stage2_shifted <= stage1_data << stage1_shift_amount;
            else
                stage2_shifted <= stage1_data >> stage1_shift_amount;
        end
    end

    // Stage 3: Output and zero flag
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            shifted_out <= 32'b0;
            zero_flag <= 1'b0;
        end else begin
            shifted_out <= stage2_shifted;
            zero_flag <= (stage2_shifted == 32'b0);
        end
    end

endmodule