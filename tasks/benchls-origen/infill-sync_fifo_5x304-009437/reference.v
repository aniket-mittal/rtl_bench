module origen_009437 #(
    parameter FIFO_DEPTH = 5,
    parameter DATA_WIDTH = 304
) (
    input wire clk,
    input wire rstn,
    input wire srst,
    input wire wrreq,
    input wire rdreq,
    input wire [DATA_WIDTH-1:0] data,
    output reg [DATA_WIDTH-1:0] q,
    output reg [3:0] fifo_count
);

    reg [DATA_WIDTH-1:0] fifo_reg [0:FIFO_DEPTH-1];
    reg [FIFO_DEPTH-1:0] fifo_wrreq;
    integer i;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            fifo_count <= 4'd0;
            q <= {DATA_WIDTH{1'b0}};
            for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
                fifo_reg[i] <= {DATA_WIDTH{1'b0}};
            end
        end else if (srst) begin
            fifo_count <= 4'd0;
            q <= {DATA_WIDTH{1'b0}};
            for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
                fifo_reg[i] <= {DATA_WIDTH{1'b0}};
            end
        end else begin
            if (rdreq && fifo_count > 4'd0) begin
                q <= fifo_reg[0];
                for (i = 0; i < FIFO_DEPTH-1; i = i + 1) begin
                    fifo_reg[i] <= fifo_reg[i+1];
                end
                fifo_reg[FIFO_DEPTH-1] <= {DATA_WIDTH{1'b0}};
                fifo_count <= (wrreq && fifo_count < FIFO_DEPTH) ? fifo_count : fifo_count - 4'd1;
            end else if (wrreq && fifo_count < FIFO_DEPTH) begin
                fifo_reg[fifo_count] <= data;
                fifo_count <= fifo_count + 4'd1;
            end
        end
    end

    always @(*) begin
        for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
            fifo_wrreq[i] = (fifo_count == i) && wrreq && (!rdreq || fifo_count == 0);
        end
    end

endmodule