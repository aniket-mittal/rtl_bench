module origen_186003(
    input clk,
    input reset,
    input [12:0] iopage_addr,
    input [15:0] data_in,
    output reg [15:0] data_out,
    input decode,
    input iopage_rd,
    input iopage_wr,
    input iopage_byte_op,
    input [15:0] switches,
    output [15:0] cpu_err,
    output reg unibus_to_r,
    output reg memory_to_r
);

    reg [15:0] switch_sample;

    [MASKED]

    always @(*) begin
        if (decode) begin
            if (iopage_addr == 13'o17570) begin
                data_out = {14'b0, unibus_to_r, memory_to_r};
            end else begin
                data_out = switch_sample;
            end
        end else begin
            data_out = 16'b0;
        end
    end

    assign cpu_err = {10'b0, unibus_to_r, memory_to_r};

`ifdef DEBUG
    always @(posedge clk) begin
        if (iopage_wr && iopage_addr == 13'o17570) begin
            ;
        end
    end
`endif

endmodule