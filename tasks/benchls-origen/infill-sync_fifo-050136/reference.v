module origen_050136 #(
    parameter W = 4,
    parameter B = 8
) (
    input wire clk,
    input wire rst_n,
    input wire wr,
    input wire rd,
    input wire [B-1:0] wr_data,
    output reg [B-1:0] rd_data,
    output reg full,
    output reg empty
);

    localparam DEPTH = 1 << W;

    reg [W-1:0] rd_ptr, wr_ptr;
    reg [B-1:0] array_reg [0:DEPTH-1];

    wire [W-1:0] rd_ptr_next = rd_ptr + 1'b1;
    wire [W-1:0] wr_ptr_next = wr_ptr + 1'b1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rd_ptr <= {W{1'b0}};
            wr_ptr <= {W{1'b0}};
            full <= 1'b0;
            empty <= 1'b1;
        end else begin
            if (wr && !full) begin
                array_reg[wr_ptr] <= wr_data;
                wr_ptr <= wr_ptr_next;
                empty <= 1'b0;
            end

            if (rd && !empty) begin
                rd_data <= array_reg[rd_ptr];
                rd_ptr <= rd_ptr_next;
                full <= 1'b0;
            end

            if (wr && !rd && !full)
                full <= (wr_ptr_next == rd_ptr);
            else if (!wr && rd && !empty)
                empty <= (rd_ptr_next == wr_ptr);
        end
    end

    always @(*) begin
        if (empty)
            rd_data = {B{1'b0}};
        else
            rd_data = array_reg[rd_ptr];
    end

endmodule