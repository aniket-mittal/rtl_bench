module origen_138322 #(
    parameter WIDTH = 104,
    parameter DEPTH = 16,
    parameter ADDR_WIDTH = $clog2(DEPTH)
) (
    input wire wr_rst,
    input wire rd_rst,
    input wire wr_clk,
    input wire rd_clk,
    input wire wr_en,
    input wire [WIDTH-1:0] din,
    output wire full,
    output wire prog_full,
    output wire [WIDTH-1:0] dout,
    output wire empty,
    output wire valid
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [ADDR_WIDTH:0] wr_ptr, rd_ptr;
    reg [ADDR_WIDTH:0] wr_ptr_gray, rd_ptr_gray;
    reg [ADDR_WIDTH:0] wr_ptr_gray_sync, rd_ptr_gray_sync;
    
    wire [ADDR_WIDTH:0] wr_ptr_bin, rd_ptr_bin;
    wire [ADDR_WIDTH:0] wr_ptr_next, rd_ptr_next;
    wire [ADDR_WIDTH:0] wr_ptr_gray_next, rd_ptr_gray_next;
    
    // Write logic
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst) begin
            wr_ptr <= 0;
            wr_ptr_gray <= 0;
        end else if (wr_en && !full) begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= din;
            wr_ptr <= wr_ptr_next;
            wr_ptr_gray <= wr_ptr_gray_next;
        end
    end
    
    // Read logic
    reg rd_en_reg;
    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            rd_ptr <= 0;
            rd_ptr_gray <= 0;
            rd_en_reg <= 0;
        end else begin
            rd_en_reg <= !empty;
            if (!empty) begin
                rd_ptr <= rd_ptr_next;
                rd_ptr_gray <= rd_ptr_gray_next;
            end
        end
    end
    
    // Synchronizers
    reg [ADDR_WIDTH:0] wr_ptr_gray_sync_temp, rd_ptr_gray_sync_temp;
    always @(posedge rd_clk or posedge rd_rst) begin
        if (rd_rst) begin
            wr_ptr_gray_sync_temp <= 0;
            wr_ptr_gray_sync <= 0;
        end else begin
            wr_ptr_gray_sync_temp <= wr_ptr_gray;
            wr_ptr_gray_sync <= wr_ptr_gray_sync_temp;
        end
    end
    
    always @(posedge wr_clk or posedge wr_rst) begin
        if (wr_rst) begin
            rd_ptr_gray_sync_temp <= 0;
            rd_ptr_gray_sync <= 0;
        end else begin
            rd_ptr_gray_sync_temp <= rd_ptr_gray;
            rd_ptr_gray_sync <= rd_ptr_gray_sync_temp;
        end
    end
    
    // Gray to binary conversion
    assign wr_ptr_bin = wr_ptr_gray_sync ^ (wr_ptr_gray_sync >> 1) ^ (wr_ptr_gray_sync >> 2) ^ (wr_ptr_gray_sync >> 3);
    assign rd_ptr_bin = rd_ptr_gray_sync ^ (rd_ptr_gray_sync >> 1) ^ (rd_ptr_gray_sync >> 2) ^ (rd_ptr_gray_sync >> 3);
    
    // Next pointer and gray code calculation
    assign wr_ptr_next = wr_ptr + 1'b1;
    assign rd_ptr_next = rd_ptr + 1'b1;
    assign wr_ptr_gray_next = (wr_ptr_next >> 1) ^ wr_ptr_next;
    assign rd_ptr_gray_next = (rd_ptr_next >> 1) ^ rd_ptr_next;
    
    // FIFO status
    assign full = (wr_ptr_gray == {~rd_ptr_gray_sync[ADDR_WIDTH:ADDR_WIDTH-1], rd_ptr_gray_sync[ADDR_WIDTH-2:0]});
    assign empty = (rd_ptr_gray == wr_ptr_gray_sync);
    assign prog_full = ((wr_ptr[ADDR_WIDTH-1:0] - rd_ptr_bin[ADDR_WIDTH-1:0]) >= (DEPTH - 2));
    
    // Output
    assign dout = mem[rd_ptr[ADDR_WIDTH-1:0]];
    assign valid = rd_en_reg;

endmodule