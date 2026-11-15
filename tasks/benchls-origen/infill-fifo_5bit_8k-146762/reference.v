module origen_146762 (
    input wire clk,
    input wire ram_full_fb_i_reg,
    input wire tmp_ram_rd_en,
    input wire [4:0] din,
    output reg Q,
    output reg [4:0] D
);

    // Memory array (5KB = 5120 bytes = 40960 bits)
    reg [4:0] memory [8191:0];
    
    // Pointers for read and write operations
    reg [12:0] write_ptr;
    reg [12:0] read_ptr;
    
    // Counter for number of elements in the FIFO
    reg [13:0] count;

    // Initialize pointers and counter
    initial begin
        write_ptr = 13'b0;
        read_ptr = 13'b0;
        count = 14'b0;
    end

    // Write operation
    always @(posedge clk) begin
        if (!ram_full_fb_i_reg) begin
            memory[write_ptr] <= din;
            write_ptr <= write_ptr + 1;
            if (write_ptr == 13'b1111111111111) begin
                write_ptr <= 13'b0;
            end
            count <= count + 1;
        end
    end

    // Read operation
    always @(posedge clk) begin
        if (tmp_ram_rd_en && count > 0) begin
            D <= memory[read_ptr];
            read_ptr <= read_ptr + 1;
            if (read_ptr == 13'b1111111111111) begin
                read_ptr <= 13'b0;
            end
            count <= count - 1;
        end
    end

    // Output valid signal
    always @(posedge clk) begin
        Q <= (count > 0);
    end

endmodule