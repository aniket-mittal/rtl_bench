module origen_204157 #(
    parameter DATAW = 64,
    parameter BYTEW = 8,
    parameter METAW = 8,
    parameter USERW = 8,
    parameter FIFO_DEPTH = 16
) (
    input wire                   clk,
    input wire                   rst_n,

    // Input FIFO interface
    input wire [DATAW-1:0]       ififo_wdata,
    input wire                   ififo_wen,
    output reg                   ififo_rdy,

    // Output interface
    output reg [DATAW-1:0]       tfifo_rdata,
    output reg [BYTEW-1:0]       tfifo_rstrb,
    output reg [BYTEW-1:0]       tfifo_rkeep,
    output reg [METAW-1:0]       tfifo_rid,
    output reg [METAW-1:0]       tfifo_rdest,
    output reg [USERW-1:0]       tfifo_ruser,
    output reg                   tfifo_rlast,
    output reg                   tfifo_rvalid,
    input wire                   tfifo_rready,

    // FIFO status signals
    output reg                   fifo_empty,
    output reg                   fifo_full,
    output reg                   fifo_almost_full
);

    reg [DATAW-1:0] mem [FIFO_DEPTH-1:0];
    reg [BYTEW-1:0] mem_strb [FIFO_DEPTH-1:0];
    reg [BYTEW-1:0] mem_keep [FIFO_DEPTH-1:0];
    reg [METAW-1:0] mem_id [FIFO_DEPTH-1:0];
    reg [METAW-1:0] mem_dest [FIFO_DEPTH-1:0];
    reg [USERW-1:0] mem_user [FIFO_DEPTH-1:0];
    reg             mem_last [FIFO_DEPTH-1:0];

    reg [DATAW-1:0] head_ptr;
    reg [DATAW-1:0] tail_ptr;
    reg [DATAW-1:0] fifo_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            head_ptr <= 0;
            tail_ptr <= 0;
            fifo_count <= 0;
            fifo_empty <= 1;
            fifo_full <= 0;
            fifo_almost_full <= 0;
            ififo_rdy <= 1;
            tfifo_rvalid <= 0;
        end else begin
            // FIFO write operation
            if (ififo_wen && ififo_rdy) begin
                mem[tail_ptr] <= ififo_wdata;
                mem_strb[tail_ptr] <= 0; // Update as per your requirement
                mem_keep[tail_ptr] <= 0; // Update as per your requirement
                mem_id[tail_ptr] <= 0; // Update as per your requirement
                mem_dest[tail_ptr] <= 0; // Update as per your requirement
                mem_user[tail_ptr] <= 0; // Update as per your requirement
                mem_last[tail_ptr] <= 0; // Update as per your requirement
                tail_ptr <= (tail_ptr == FIFO_DEPTH-1) ? 0 : tail_ptr + 1;
                fifo_count <= fifo_count + 1;
                fifo_empty <= 0;
                fifo_full <= (fifo_count == FIFO_DEPTH);
                fifo_almost_full <= (fifo_count >= FIFO_DEPTH-1);
                ififo_rdy <= !fifo_full;
            end

            // FIFO read operation
            if (tfifo_rready && tfifo_rvalid) begin
                tfifo_rdata <= mem[head_ptr];
                tfifo_rstrb <= mem_strb[head_ptr];
                tfifo_rkeep <= mem_keep[head_ptr];
                tfifo_rid <= mem_id[head_ptr];
                tfifo_rdest <= mem_dest[head_ptr];
                tfifo_ruser <= mem_user[head_ptr];
                tfifo_rlast <= mem_last[head_ptr];
                tfifo_rvalid <= 1;
                head_ptr <= (head_ptr == FIFO_DEPTH-1) ? 0 : head_ptr + 1;
                fifo_count <= fifo_count - 1;
                fifo_empty <= (fifo_count == 1);
                fifo_full <= 0;
                fifo_almost_full <= (fifo_count >= FIFO_DEPTH-2);
            end else begin
                tfifo_rvalid <= 0;
            end
        end
    end

endmodule