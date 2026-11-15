module origen_036489 (
    input wire clk,
    input wire rstp,
    input wire [7:0] src_in,
    input wire [7:0] dst_in,
    input wire [31:0] data_in,
    input wire writep,
    input wire readp,
    output reg [7:0] src_out,
    output reg [7:0] dst_out,
    output reg [31:0] data_out,
    output reg emptyp,
    output reg fullp
);

    parameter DEPTH = 2;
    parameter FULL = 8;
    parameter EMPTY = 8;

    reg [47:0] fifomem [0:7];
    reg [2:0] head, tail;
    reg [3:0] count;

    always @(posedge clk or posedge rstp) begin
        if (rstp) begin
            head <= 3'b0;
            tail <= 3'b0;
            count <= 4'b0;
            src_out <= 8'b0;
            dst_out <= 8'b0;
            data_out <= 32'b0;
            emptyp <= 1'b1;
            fullp <= 1'b0;
        end else begin
            if (writep && !fullp) begin
                fifomem[head] <= {src_in, dst_in, data_in};
                head <= head + 1;
                if (!readp || count == 0)
                    count <= count + 1;
            end

            if (readp && !emptyp) begin
                {src_out, dst_out, data_out} <= fifomem[tail];
                tail <= tail + 1;
                if (!writep || count == FULL)
                    count <= count - 1;
            end

            emptyp <= (count == EMPTY);
            fullp <= (count >= FULL);
        end
    end

endmodule