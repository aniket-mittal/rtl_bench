module origen_143499 #(
    parameter DATA_WIDTH = 36,
    parameter FIFO_DEPTH = 256
) (
    input wire int_clk,
    input wire ext_clk,
    input wire rst,
    input wire [DATA_WIDTH-1:0] RAM_D_pi,
    input wire [DATA_WIDTH-1:0] datain,
    input wire src_rdy_i,
    input wire dst_rdy_i,
    output reg [DATA_WIDTH-1:0] dataout,
    output reg src_rdy_o,
    output reg dst_rdy_o,
    output reg [31:0] debug,
    output reg [31:0] debug2
);

// Internal FIFO signals
reg [DATA_WIDTH-1:0] int_fifo [0:FIFO_DEPTH-1];
reg [$clog2(FIFO_DEPTH):0] int_wr_ptr, int_rd_ptr;
wire int_fifo_empty, int_fifo_full;

// External FIFO signals
reg [DATA_WIDTH-1:0] ext_fifo [0:FIFO_DEPTH-1];
reg [$clog2(FIFO_DEPTH):0] ext_wr_ptr, ext_rd_ptr;
wire ext_fifo_empty, ext_fifo_full;

// Synchronization registers
reg [2:0] int_to_ext_sync, ext_to_int_sync;

// FIFO status
assign int_fifo_empty = (int_wr_ptr == int_rd_ptr);
assign int_fifo_full = (int_wr_ptr[$clog2(FIFO_DEPTH)-1:0] == int_rd_ptr[$clog2(FIFO_DEPTH)-1:0]) &&
                       (int_wr_ptr[$clog2(FIFO_DEPTH)] != int_rd_ptr[$clog2(FIFO_DEPTH)]);

assign ext_fifo_empty = (ext_wr_ptr == ext_rd_ptr);
assign ext_fifo_full = (ext_wr_ptr[$clog2(FIFO_DEPTH)-1:0] == ext_rd_ptr[$clog2(FIFO_DEPTH)-1:0]) &&
                       (ext_wr_ptr[$clog2(FIFO_DEPTH)] != ext_rd_ptr[$clog2(FIFO_DEPTH)]);

// Internal clock domain logic
always @(posedge int_clk or posedge rst) begin
    if (rst) begin
        int_wr_ptr <= 0;
        int_rd_ptr <= 0;
        src_rdy_o <= 1'b0;
        dst_rdy_o <= 1'b0;
        dataout <= {DATA_WIDTH{1'b0}};
        int_to_ext_sync <= 3'b000;
    end else begin
        // Write to internal FIFO
        if (src_rdy_i && !int_fifo_full) begin
            int_fifo[int_wr_ptr[$clog2(FIFO_DEPTH)-1:0]] <= datain;
            int_wr_ptr <= int_wr_ptr + 1;
        end

        // Read from internal FIFO
        if (dst_rdy_i && !int_fifo_empty) begin
            dataout <= int_fifo[int_rd_ptr[$clog2(FIFO_DEPTH)-1:0]];
            int_rd_ptr <= int_rd_ptr + 1;
        end

        // Update ready signals
        src_rdy_o <= !int_fifo_full;
        dst_rdy_o <= !int_fifo_empty;

        // Synchronize external FIFO status
        int_to_ext_sync <= {int_to_ext_sync[1:0], ext_fifo_empty};
    end
end

// External clock domain logic
always @(posedge ext_clk or posedge rst) begin
    if (rst) begin
        ext_wr_ptr <= 0;
        ext_rd_ptr <= 0;
        ext_to_int_sync <= 3'b000;
    end else begin
        // Write to external FIFO
        if (!ext_fifo_full) begin
            ext_fifo[ext_wr_ptr[$clog2(FIFO_DEPTH)-1:0]] <= RAM_D_pi;
            ext_wr_ptr <= ext_wr_ptr + 1;
        end

        // Read from external FIFO
        if (!int_to_ext_sync[2] && !ext_fifo_empty) begin
            ext_rd_ptr <= ext_rd_ptr + 1;
        end

        // Synchronize internal FIFO status
        ext_to_int_sync <= {ext_to_int_sync[1:0], int_fifo_full};
    end
end

// Debug outputs
always @(posedge int_clk) begin
    debug <= {int_wr_ptr, int_rd_ptr, int_fifo_full, int_fifo_empty, src_rdy_i, dst_rdy_i, src_rdy_o, dst_rdy_o};
    debug2 <= {ext_wr_ptr, ext_rd_ptr, ext_fifo_full, ext_fifo_empty, int_to_ext_sync, ext_to_int_sync};
end

endmodule