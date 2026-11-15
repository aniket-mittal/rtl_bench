module origen_051364 (
    input wire clk,
    input wire [31:0] address,
    input wire read,
    input wire [511:0] dataIn,
    output reg hit,
    output reg [31:0] dataOut
);

    // Cache parameters
    parameter BLOCKS = 256;
    parameter WORDS = 16;
    parameter SIZE = 32;
    parameter BLOCK_SIZE = 512;

    // Cache memory
    reg [533:0] cache [0:BLOCKS-1]; // 1 valid bit + 20 tag bits + 512 data bits

    // Address breakdown
    wire [7:0] index;
    wire [3:0] offset;
    wire [19:0] tag;

    assign index = address[11:4];
    assign offset = address[3:0];
    assign tag = address[31:12];

    // Cache entry
    wire valid;
    wire [19:0] stored_tag;
    wire [511:0] data;

    assign valid = cache[index][533];
    assign stored_tag = cache[index][532:513];
    assign data = cache[index][511:0];

    always @(posedge clk) begin
        if (!read) begin
            // Write operation
            cache[index] <= {1'b1, tag, dataIn};
            dataOut <= dataIn[offset*SIZE +: SIZE];
            hit <= 1'b1;
        end else begin
            // Read operation
            if (valid && (stored_tag == tag)) begin
                hit <= 1'b1;
                dataOut <= data[offset*SIZE +: SIZE];
            end else begin
                hit <= 1'b0;
                dataOut <= data[offset*SIZE +: SIZE];
            end
        end
    end

endmodule