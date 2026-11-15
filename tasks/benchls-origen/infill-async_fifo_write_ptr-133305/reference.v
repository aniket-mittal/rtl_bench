module origen_133305 #(
    parameter ADDRWIDTH = 4,
    parameter FIFODEPTH = 16,
    parameter MINBIN2 = 0,
    parameter MAXBIN2 = FIFODEPTH - 1
) (
    input wire w_clk,
    input wire w_rst_n,
    input wire w_en,
    input wire [ADDRWIDTH:0] r2w_ptr,
    output reg [ADDRWIDTH:0] wbin,
    output reg [ADDRWIDTH:0] wptr,
    output wire inc,
    output reg w_full,
    output reg [ADDRWIDTH:0] w_counter,
    output reg w_error
);

    reg [ADDRWIDTH:0] wbin_next;
    reg [ADDRWIDTH:0] wptr_next;
    reg [ADDRWIDTH:0] w_counter_next;
    reg w_full_next;
    reg w_error_next;

    // Binary to Gray conversion function
    function [ADDRWIDTH:0] bin2gray;
        input [ADDRWIDTH:0] bin;
        begin
            bin2gray = bin ^ (bin >> 1);
        end
    endfunction

    // Gray to Binary conversion function
    function [ADDRWIDTH:0] gray2bin;
        input [ADDRWIDTH:0] gray;
        reg [ADDRWIDTH:0] bin;
        integer i;
        begin
            bin = gray;
            for (i = 1; i <= ADDRWIDTH; i = i + 1)
                bin = bin ^ (gray >> i);
            gray2bin = bin;
        end
    endfunction

    // Increment function
    function [ADDRWIDTH:0] increment;
        input [ADDRWIDTH:0] value;
        begin
            if (value == MAXBIN2)
                increment = MINBIN2;
            else
                increment = value + 1;
        end
    endfunction

    // Combinational logic
    always @(*) begin
        wbin_next = wbin;
        wptr_next = wptr;
        w_counter_next = w_counter;
        w_full_next = w_full;
        w_error_next = w_error;

        if (w_en && !w_full) begin
            wbin_next = increment(wbin);
            wptr_next = bin2gray(wbin_next);
        end

        w_counter_next = wbin_next - gray2bin(r2w_ptr);
        if (w_counter_next > FIFODEPTH) begin
            w_counter_next = w_counter_next - FIFODEPTH;
        end

        w_full_next = (w_counter_next == FIFODEPTH);
        w_error_next = (w_counter_next > FIFODEPTH);
    end

    // Sequential logic
    always @(posedge w_clk or negedge w_rst_n) begin
        if (!w_rst_n) begin
            wbin <= MINBIN2;
            wptr <= bin2gray(MINBIN2);
            w_counter <= 0;
            w_full <= 1'b0;
            w_error <= 1'b0;
        end else begin
            wbin <= wbin_next;
            wptr <= wptr_next;
            w_counter <= w_counter_next;
            w_full <= w_full_next;
            w_error <= w_error_next;
        end
    end

    // Output assignment
    assign inc = w_en && !w_full;

endmodule