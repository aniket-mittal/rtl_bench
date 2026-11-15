module origen_148689 #(
    parameter k = 256,  // Number of memory locations
    parameter w = 8     // Number of bits per memory location
)(
    input [7:0] address,  // Assuming 8-bit address for 256 locations
    input [w-1:0] data,
    input clk,
    input rst_n,
    input write_en,
    input test_en,
    output reg pass
);

    reg [w-1:0] memory [0:k-1];
    reg [7:0] test_addr;
    reg [w-1:0] test_data;
    reg test_active;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pass <= 0;
            test_addr <= 0;
            test_data <= 0;
            test_active <= 0;
        end else begin
            if (write_en) begin
                memory[address] <= data;
            end

            if (test_en && !test_active) begin
                test_active <= 1;
                test_addr <= 0;
                test_data <= {w{1'b1}};  // Start with all 1's
                pass <= 1;
            end

            if (test_active) begin
                if (test_addr < k) begin
                    // Write test pattern
                    memory[test_addr] <= test_data;
                    
                    // Read and verify
                    if (memory[test_addr] != test_data) begin
                        pass <= 0;
                    end

                    // Update test pattern and address
                    test_data <= ~test_data;
                    test_addr <= test_addr + 1;
                end else begin
                    test_active <= 0;
                end
            end
        end
    end

endmodule