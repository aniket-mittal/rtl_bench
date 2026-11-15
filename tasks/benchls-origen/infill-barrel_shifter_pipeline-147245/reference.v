module origen_147245 (
    input wire clk,
    input wire rst,
    input wire [7:0] data_in,
    input wire [1:0] shift_amount,
    input wire select,
    output reg [7:0] data_out
);

    reg [7:0] stage1_data, stage2_data;
    reg [1:0] stage1_shift, stage2_shift;
    reg stage1_select, stage2_select;
    
    wire [7:0] left_shift, right_shift;
    wire [7:0] shifted_data;

    // Stage 1: Input Registration
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage1_data <= 8'b0;
            stage1_shift <= 2'b0;
            stage1_select <= 1'b0;
        end else begin
            stage1_data <= data_in;
            stage1_shift <= shift_amount;
            stage1_select <= select;
        end
    end

    // Stage 2: Shift Operation
    assign left_shift = stage1_data << stage1_shift;
    assign right_shift = stage1_data >> stage1_shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage2_data <= 8'b0;
            stage2_shift <= 2'b0;
            stage2_select <= 1'b0;
        end else begin
            stage2_data <= stage1_data;
            stage2_shift <= stage1_shift;
            stage2_select <= stage1_select;
        end
    end

    // Stage 3: Multiplexer and XOR Operation
    assign shifted_data = stage2_select ? right_shift : left_shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 8'b0;
        end else begin
            data_out <= stage2_data ^ shifted_data;
        end
    end

endmodule