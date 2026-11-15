module origen_066384 (
    input [6:0] addr,
    output reg [7:0] data
);
    reg [7:0] rom [0:127];
    integer i;

    initial begin
        for (i = 0; i < 128; i = i + 1) begin
            rom[i] = i * 2;
        end
    end

    always @(*) begin
        data = rom[addr];
    end
endmodule

module async_fifo #(
    parameter p = 7,  // Pointer width
    parameter w = 8   // Data width
) (
    input read_clk, write_clk, reset,
    output reg [w-1:0] data_out,
    output r_empty, w_full
);
    localparam depth = 1 << p;

    reg [w-1:0] mem [0:depth-1];
    reg [p:0] read_pointer_bin, write_pointer_bin;
    reg [p:0] read_pointer_gray, write_pointer_gray;
    reg [p:0] read_s1, read_s2, write_s1, write_s2;

    wire [w-1:0] tx_data;
    wire [p-1:0] write_addr;

    transmission_module tx (
        .addr(write_pointer_bin[p-1:0]),
        .data(tx_data)
    );

    // Binary to Gray conversion
    function [p:0] bin2gray(input [p:0] bin);
        bin2gray = bin ^ (bin >> 1);
    endfunction

    // Gray to Binary conversion
    function [p:0] gray2bin(input [p:0] gray);
        integer i;
        reg [p:0] bin;
        begin
            bin = gray;
            for (i = 1; i <= p; i = i + 1)
                bin = bin ^ (gray >> i);
            gray2bin = bin;
        end
    endfunction

    // Write logic
    always @(posedge write_clk or posedge reset) begin
        if (reset) begin
            write_pointer_bin <= 0;
            write_pointer_gray <= 0;
        end else if (!w_full) begin
            mem[write_pointer_bin[p-1:0]] <= tx_data;
            write_pointer_bin <= write_pointer_bin + 1;
            write_pointer_gray <= bin2gray(write_pointer_bin + 1);
        end
    end

    // Read logic
    always @(posedge read_clk or posedge reset) begin
        if (reset) begin
            read_pointer_bin <= 0;
            read_pointer_gray <= 0;
            data_out <= 0;
        end else if (!r_empty) begin
            data_out <= mem[read_pointer_bin[p-1:0]];
            read_pointer_bin <= read_pointer_bin + 1;
            read_pointer_gray <= bin2gray(read_pointer_bin + 1);
        end
    end

    // Synchronizers
    always @(posedge read_clk or posedge reset) begin
        if (reset) begin
            read_s1 <= 0;
            read_s2 <= 0;
        end else begin
            read_s1 <= write_pointer_gray;
            read_s2 <= read_s1;
        end
    end

    always @(posedge write_clk or posedge reset) begin
        if (reset) begin
            write_s1 <= 0;
            write_s2 <= 0;
        end else begin
            write_s1 <= read_pointer_gray;
            write_s2 <= write_s1;
        end
    end

    // Full and Empty flags
    assign r_empty = (read_pointer_gray == write_pointer_gray);
    assign w_full = (write_pointer_gray == {~read_pointer_gray[p:p-1], read_pointer_gray[p-2:0]});

endmodule