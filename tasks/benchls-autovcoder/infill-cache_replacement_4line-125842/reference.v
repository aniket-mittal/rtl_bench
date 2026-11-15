module autovcoder_125842(  
    input wire clk,  
    input wire reset,  
    input wire [7:0] address,  
    input wire mode, // 0 for FIFO, 1 for LRU  
    output reg [3:0] cache_line_replaced  
);  
    reg [7:0] cache[3:0]; // 4 lines of cache  
    reg [1:0] head; // head pointer for FIFO  
    reg [3:0] lru_counter[3:0]; // LRU counters  
    reg [1:0] lru_index; // Index for selecting LRU line  
    integer i;  
  
    always @(posedge clk or posedge reset) begin  
        if (reset) begin  
            // Reset cache and pointers  
            head <= 0;  
            for (i = 0; i < 4; i = i + 1) begin  
                cache[i] <= 8'b0;  
                lru_counter[i] <= 0;  
            end  
            cache_line_replaced <= 4'b0;  
        end else begin  
            if (mode == 0) begin // FIFO  
                cache_line_replaced <= head;  
                cache[head] <= address;  
                head <= (head + 1) % 4;  
            end else begin // LRU  
                // Update LRU counters  
                for (i = 0; i < 4; i = i + 1) begin  
                    if (cache[i] != address) begin  
                        lru_counter[i] <= lru_counter[i] + 1;  
                    end  
                end  
                // Find the LRU index  
                lru_index = 0;  
                for (i = 1; i < 4; i = i + 1) begin  
                    if (lru_counter[i] > lru_counter[lru_index]) begin  
                        lru_index = i;  
                    end  
                end  
                cache_line_replaced <= lru_index;  
                cache[lru_index] <= address;  
                lru_counter[lru_index] <= 0; // Reset counter for the recently used line  
            end  
        end  
    end  
endmodule