module origen_073377 (
    input wire clk,
    input wire reset,
    input wire [31:0] w_ip_addr,
    input wire [47:0] w_mac_addr,
    input wire w_en,
    input wire [31:0] r_ip_addr,
    input wire r_en,
    output reg [47:0] r_mac_addr
);

    reg [80:0] cache [0:7];  // 8 entries, each 81 bits wide
    reg [2:0] next;  // Pointer to next available slot

    integer i;
    reg found;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 1; i < 8; i = i + 1) begin
                cache[i] <= 81'b0;  // Invalidate all entries except the first
            end
            cache[0] <= {1'b1, 32'b0, 48'b0};  // Set first entry to default value
            next <= 3'b0;
            r_mac_addr <= 48'b0;
        end else begin
            if (w_en) begin
                // Write operation
                found = 0;
                for (i = 0; i < 8; i = i + 1) begin
                    if (cache[i][79:48] == w_ip_addr && cache[i][80]) begin
                        cache[i][47:0] <= w_mac_addr;  // Update existing entry
                        found = 1;
                    end
                end
                if (!found) begin
                    // IP not found, create new entry
                    cache[next] <= {1'b1, w_ip_addr, w_mac_addr};
                    next <= next + 1;
                end
            end

            if (r_en) begin
                // Read operation
                r_mac_addr <= 48'b0;  // Default to zero
                for (i = 0; i < 8; i = i + 1) begin
                    if (cache[i][79:48] == r_ip_addr && cache[i][80]) begin
                        r_mac_addr <= cache[i][47:0];
                    end
                end
            end
        end
    end

endmodule