module origen_100602 #(
    parameter DEPTH = 8,
    parameter BITS = 64
) (
    input wire clk,
    input wire rst_n,
    input wire en,
    input wire [BITS-1:0] d,
    output wire [BITS-1:0] q
);

    reg [DEPTH-1:0] st;
    wire [DEPTH-1:0] st_shift, nxtst;
    wire [DEPTH-1:0] sel;
    wire full;
    reg [BITS-1:0] fiforeg [DEPTH-1:0];
    wire [BITS-1:0] fifo_in;

    assign full = &st;
    assign q = full ? fiforeg[DEPTH-1] : {BITS{1'b0}};
    assign fifo_in = d;

    assign st_shift = {st[DEPTH-2:0], 1'b1};
    assign nxtst = en & ~full ? st_shift : st;

    genvar i;
    generate
        for (i = 0; i < DEPTH; i = i + 1) begin : gen_fifo_stages
            if (i == 0) begin
                assign sel[i] = en & ~st[i];
            end else begin
                assign sel[i] = en & st[i-1] & ~st[i];
            end

            always @(posedge clk or negedge rst_n) begin
                if (~rst_n) begin
                    fiforeg[i] <= {BITS{1'b0}};
                end else if (sel[i]) begin
                    fiforeg[i] <= fifo_in;
                end else if (en & ~full) begin
                    fiforeg[i] <= (i == 0) ? fifo_in : fiforeg[i-1];
                end
            end
        end
    endgenerate

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            st <= {DEPTH{1'b0}};
        end else begin
            st <= nxtst;
        end
    end

endmodule