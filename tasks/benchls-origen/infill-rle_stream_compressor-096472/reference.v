module origen_096472 #(
    parameter DATA_WIDTH = 8,
    parameter CTR_WIDTH = 4
) (
    input wire clk,
    input wire rst,
    input wire ready,
    input wire [DATA_WIDTH-1:0] stream_in,
    output reg [DATA_WIDTH+CTR_WIDTH-1:0] compressed_stream,
    output reg valid
);

localparam CTR_MAX = (1 << CTR_WIDTH) - 1;

reg [DATA_WIDTH-1:0] stream_in_prev;
reg [CTR_WIDTH-1:0] seq_counter;
reg ready_prev;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        compressed_stream <= 0;
        valid <= 0;
        stream_in_prev <= 0;
        seq_counter <= 0;
        ready_prev <= 0;
    end else begin
        ready_prev <= ready;
        
        if (ready && ready_prev) begin
            if (stream_in == stream_in_prev) begin
                if (seq_counter < CTR_MAX) begin
                    seq_counter <= seq_counter + 1;
                    valid <= 0;
                end else begin
                    compressed_stream <= {seq_counter, stream_in_prev};
                    valid <= 1;
                    seq_counter <= 0;
                end
            end else begin
                if (seq_counter > 0) begin
                    compressed_stream <= {seq_counter, stream_in_prev};
                    valid <= 1;
                end else begin
                    valid <= 0;
                end
                seq_counter <= 0;
                stream_in_prev <= stream_in;
            end
        end else begin
            valid <= 0;
        end
    end
end

endmodule