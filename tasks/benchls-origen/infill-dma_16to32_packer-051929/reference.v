module origen_051929 (
    input wire sys_clk,
    input wire rst_n,
    input wire dma_rst_i,
    input wire dma_de_16b_i,
    input wire [15:0] dma_d_16b_i,
    output reg dma_de_32b_o,
    output reg dma_we_32b_o,
    output reg [31:0] dma_d_32b_o
);

reg [2:0] allian_cnt;
reg dma_de_16b_d1;
reg [15:0] dma_d_16b_d1;

always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
        allian_cnt <= 3'b000;
        dma_de_16b_d1 <= 1'b0;
        dma_d_16b_d1 <= 16'h0000;
        dma_de_32b_o <= 1'b0;
        dma_we_32b_o <= 1'b0;
        dma_d_32b_o <= 32'h00000000;
    end else begin
        dma_de_16b_d1 <= dma_de_16b_i;
        dma_d_16b_d1 <= dma_d_16b_i;
        dma_de_32b_o <= dma_de_16b_d1;

        if (dma_de_16b_i) begin
            allian_cnt <= allian_cnt + 1'b1;
        end else begin
            allian_cnt <= 3'b000;
        end

        case (allian_cnt)
            3'b000, 3'b010: begin
                dma_d_32b_o <= {dma_d_16b_i, dma_d_16b_d1};
                dma_we_32b_o <= 1'b1;
            end
            3'b001: begin
                dma_d_32b_o <= {dma_d_16b_i, dma_d_16b_d1};
                dma_we_32b_o <= 1'b0;
            end
            default: begin
                dma_d_32b_o <= 32'h00000000;
                dma_we_32b_o <= 1'b0;
            end
        endcase
    end
end

endmodule