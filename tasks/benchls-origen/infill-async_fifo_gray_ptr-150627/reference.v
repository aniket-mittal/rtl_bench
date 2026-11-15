module origen_150627 #(
    parameter ADDRWIDTH = 5,
    parameter SLOPBITS = 2
)
(
    // Write Interface
    input wire wr_clk,
    input wire wr_reset_l,
    input wire we,
    output wire full,
    output wire ovf,

    // Read Interface
    input wire rd_clk,
    input wire rd_reset_l,
    input wire re,
    output wire ne,
    output wire unf,

    // FIFO Data
    input wire [ADDRWIDTH-SLOPBITS-1:0] din,
    output wire [ADDRWIDTH-SLOPBITS-1:0] dout
);

    localparam FIFO_DEPTH = (1 << (ADDRWIDTH - SLOPBITS));

    // Write Pointer
    reg [ADDRWIDTH-1:0] wr_addr;
    wire [ADDRWIDTH-1:0] wr_addr_g;
    wire [ADDRWIDTH-1:0] wr_addr_r;

    // Read Pointer
    reg [ADDRWIDTH-1:0] rd_addr;
    wire [ADDRWIDTH-1:0] rd_addr_g;
    wire [ADDRWIDTH-1:0] rd_addr_r;

    // FIFO Memory
    reg [ADDRWIDTH-SLOPBITS-1:0] fifo_mem [FIFO_DEPTH-1:0];

    // Write Pointer Logic
    always @(posedge wr_clk or negedge wr_reset_l) begin
        if (!wr_reset_l) begin
            wr_addr <= 0;
        end else if (we) begin
            wr_addr <= wr_addr + 1'b1;
        end
    end
    assign wr_addr_g = bin_to_gray(wr_addr);
    assign wr_addr_r = gray_to_bin(wr_addr_g);

    // Read Pointer Logic
    always @(posedge rd_clk or negedge rd_reset_l) begin
        if (!rd_reset_l) begin
            rd_addr <= 0;
        end else if (re) begin
            rd_addr <= rd_addr + 1'b1;
        end
    end
    assign rd_addr_g = bin_to_gray(rd_addr);
    assign rd_addr_r = gray_to_bin(rd_addr_g);

    // FIFO Memory Access
    always @(posedge wr_clk) begin
        if (we) begin
            fifo_mem[wr_addr_r[ADDRWIDTH-SLOPBITS-1:0]] <= din;
        end
    end
    assign dout = fifo_mem[rd_addr_r[ADDRWIDTH-SLOPBITS-1:0]];

    // Full and Empty Detection
    assign full = (wr_addr_r[ADDRWIDTH-1:SLOPBITS] == (rd_addr_g[ADDRWIDTH-1:SLOPBITS] ^ {1'b1, {(ADDRWIDTH-SLOPBITS-1){1'b0}}}));
    assign ne = (wr_addr_g != rd_addr_g);

    // Overflow and Underflow Detection
    assign ovf = we & full;
    assign unf = re & ~ne;

    // Binary to Gray Code Conversion
    function [ADDRWIDTH-1:0] bin_to_gray;
        input [ADDRWIDTH-1:0] binary;
        integer i;
        begin
            bin_to_gray = binary ^ (binary >> 1);
        end
    endfunction

    // Gray Code to Binary Conversion
    function [ADDRWIDTH-1:0] gray_to_bin;
        input [ADDRWIDTH-1:0] gray;
        integer i;
        reg [ADDRWIDTH-1:0] binary;
        begin
            binary = gray;
            for (i = ADDRWIDTH-2; i >= 0; i = i - 1) begin
                binary[i] = binary[i] ^ binary[i+1];
            end
            gray_to_bin = binary;
        end
    endfunction

endmodule