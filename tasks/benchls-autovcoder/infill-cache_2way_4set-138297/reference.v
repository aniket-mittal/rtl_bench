module autovcoder_138297 (
    input clk,
    input rst,
    input [7:0] addr,
    input [7:0] data,
    input we,          // write enable
    output reg hit     // cache hit indicator
);
    reg [7:0] cache_data[3:0][1:0]; // 4 sets, 2 lines per set
    reg [1:0] lru[3:0];              // 2-bit LRU counter for each set (0: line 0 is LRU, 1: line 1 is LRU)
    wire [1:0] set_index;
    wire [7:0] tag;

    assign set_index = addr[3:2]; // 2 bits for set index
    assign tag = addr[7:4];       // 4 bits for tag

    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset cache
            for (i = 0; i < 4; i = i + 1) begin
                cache_data[i][0] = 8'b0;
                cache_data[i][1] = 8'b0;
                lru[i] = 2'b00; // Initialize LRU
            end
            hit <= 0;
        end else begin
            if (we) begin // Write operation
                // Check for LRU line to replace
                if (lru[set_index] == 2'b00) begin
                    cache_data[set_index][0] <= data;
                    lru[set_index] <= 2'b01; // Update LRU
                end else begin
                    cache_data[set_index][1] <= data;
                    lru[set_index] <= 2'b00; // Update LRU
                end
                hit <= 0;
            end else begin // Read operation
                if (cache_data[set_index][0][7:4] == tag) begin
                    hit <= 1; // Hit in line 0
                    lru[set_index] <= 2'b01; // Update LRU
                end else if (cache_data[set_index][1][7:4] == tag) begin
                    hit <= 1; // Hit in line 1
                    lru[set_index] <= 2'b00; // Update LRU
                end else begin
                    hit <= 0; // Miss
                end
            end
        end
    end
endmodule