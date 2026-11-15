module origen_125852 (
    input wire clk,
    input wire rst_n,
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output reg [15:0] Y
);

    reg [3:0] stage1_input;
    reg [3:0] stage2_input;
    reg [3:0] stage3_input;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stage1_input <= 4'b0000;
            stage2_input <= 4'b0000;
            stage3_input <= 4'b0000;
            Y <= 16'h0000;
        end else begin
            // Stage 1: Input registration
            stage1_input <= {A, B, C, D};

            // Stage 2: Intermediate stage
            stage2_input <= stage1_input;

            // Stage 3: Decoding
            stage3_input <= stage2_input;

            // Output stage: Generate decoded output
            case (stage3_input)
                4'b0000: Y <= 16'h0001;
                4'b0001: Y <= 16'h0002;
                4'b0010: Y <= 16'h0004;
                4'b0011: Y <= 16'h0008;
                4'b0100: Y <= 16'h0010;
                4'b0101: Y <= 16'h0020;
                4'b0110: Y <= 16'h0040;
                4'b0111: Y <= 16'h0080;
                4'b1000: Y <= 16'h0100;
                4'b1001: Y <= 16'h0200;
                4'b1010: Y <= 16'h0400;
                4'b1011: Y <= 16'h0800;
                4'b1100: Y <= 16'h1000;
                4'b1101: Y <= 16'h2000;
                4'b1110: Y <= 16'h4000;
                4'b1111: Y <= 16'h8000;
                default: Y <= 16'h0000;
            endcase
        end
    end

endmodule