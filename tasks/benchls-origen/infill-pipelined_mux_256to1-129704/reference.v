module origen_129704 (
    input wire clk,
    input wire rst,
    input wire [255:0] data_in,
    input wire [7:0] sel,
    output reg out
);

    // Pipeline registers
    reg [127:0] stage1_data;
    reg [63:0] stage2_data;
    reg [31:0] stage3_data;
    reg [15:0] stage4_data;
    reg [7:0] stage5_data;
    reg [3:0] stage6_data;
    reg [1:0] stage7_data;

    reg [6:0] sel_pipe;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stage1_data <= 128'b0;
            stage2_data <= 64'b0;
            stage3_data <= 32'b0;
            stage4_data <= 16'b0;
            stage5_data <= 8'b0;
            stage6_data <= 4'b0;
            stage7_data <= 2'b0;
            sel_pipe <= 7'b0;
            out <= 1'b0;
        end else begin
            // Stage 1: 256 to 128
            stage1_data <= (sel[7]) ? data_in[255:128] : data_in[127:0];
            
            // Stage 2: 128 to 64
            stage2_data <= (sel_pipe[6]) ? stage1_data[127:64] : stage1_data[63:0];
            
            // Stage 3: 64 to 32
            stage3_data <= (sel_pipe[5]) ? stage2_data[63:32] : stage2_data[31:0];
            
            // Stage 4: 32 to 16
            stage4_data <= (sel_pipe[4]) ? stage3_data[31:16] : stage3_data[15:0];
            
            // Stage 5: 16 to 8
            stage5_data <= (sel_pipe[3]) ? stage4_data[15:8] : stage4_data[7:0];
            
            // Stage 6: 8 to 4
            stage6_data <= (sel_pipe[2]) ? stage5_data[7:4] : stage5_data[3:0];
            
            // Stage 7: 4 to 2
            stage7_data <= (sel_pipe[1]) ? stage6_data[3:2] : stage6_data[1:0];
            
            // Final stage: 2 to 1
            out <= (sel_pipe[0]) ? stage7_data[1] : stage7_data[0];

            // Pipeline the select signals
            sel_pipe <= sel[6:0];
        end
    end

endmodule