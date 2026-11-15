module origen_131974 #(
    parameter bits = 8
) (
    input wire clkA,
    input wire clkB,
    input wire rst,
    input wire wrEnable,
    input wire rdEnable,
    input wire [bits-1:0] inputData,
    output reg [bits-1:0] outputData
);

    // FIFO parameters
    localparam DEPTH = 8;
    localparam PTR_WIDTH = $clog2(DEPTH);

    // FIFO memory
    reg [bits-1:0] fifo_mem [0:DEPTH-1];

    // Write domain registers
    reg [PTR_WIDTH-1:0] wr_ptr;
    reg [PTR_WIDTH-1:0] wr_ptr_gray;
    reg [PTR_WIDTH-1:0] rd_ptr_sync;

    // Read domain registers
    reg [PTR_WIDTH-1:0] rd_ptr;
    reg [PTR_WIDTH-1:0] rd_ptr_gray;
    reg [PTR_WIDTH-1:0] wr_ptr_sync;

    // Synchronizers
    reg [PTR_WIDTH-1:0] wr_ptr_gray_sync1, wr_ptr_gray_sync2;
    reg [PTR_WIDTH-1:0] rd_ptr_gray_sync1, rd_ptr_gray_sync2;

    // FIFO status
    wire full, empty;

    // Gray code conversion functions
    function [PTR_WIDTH-1:0] bin2gray(input [PTR_WIDTH-1:0] bin);
        bin2gray = bin ^ (bin >> 1);
    endfunction

    function [PTR_WIDTH-1:0] gray2bin(input [PTR_WIDTH-1:0] gray);
        integer i;
        reg [PTR_WIDTH-1:0] bin;
        begin
            bin = gray;
            for (i = 1; i < PTR_WIDTH; i = i + 1)
                bin = bin ^ (gray >> i);
            gray2bin = bin;
        end
    endfunction

    // Write domain logic
    always @(posedge clkA or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            wr_ptr_gray <= 0;
        end else if (wrEnable && !full) begin
            fifo_mem[wr_ptr] <= inputData;
            wr_ptr <= wr_ptr + 1;
            wr_ptr_gray <= bin2gray(wr_ptr + 1);
        end
    end

    // Read domain logic
    always @(posedge clkB or posedge rst) begin
        if (rst) begin
            rd_ptr <= 0;
            rd_ptr_gray <= 0;
            outputData <= 0;
        end else if (rdEnable && !empty) begin
            outputData <= fifo_mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            rd_ptr_gray <= bin2gray(rd_ptr + 1);
        end
    end

    // Synchronizers for write pointer
    always @(posedge clkB or posedge rst) begin
        if (rst) begin
            wr_ptr_gray_sync1 <= 0;
            wr_ptr_gray_sync2 <= 0;
        end else begin
            wr_ptr_gray_sync1 <= wr_ptr_gray;
            wr_ptr_gray_sync2 <= wr_ptr_gray_sync1;
        end
    end

    // Synchronizers for read pointer
    always @(posedge clkA or posedge rst) begin
        if (rst) begin
            rd_ptr_gray_sync1 <= 0;
            rd_ptr_gray_sync2 <= 0;
        end else begin
            rd_ptr_gray_sync1 <= rd_ptr_gray;
            rd_ptr_gray_sync2 <= rd_ptr_gray_sync1;
        end
    end

    // Convert synchronized gray code pointers to binary
    always @* begin
        wr_ptr_sync = gray2bin(wr_ptr_gray_sync2);
        rd_ptr_sync = gray2bin(rd_ptr_gray_sync2);
    end

    // FIFO status
    assign full = (wr_ptr_gray == {~rd_ptr_sync[PTR_WIDTH-1:PTR_WIDTH-2], rd_ptr_sync[PTR_WIDTH-3:0]});
    assign empty = (rd_ptr_gray == wr_ptr_gray_sync2);

endmodule