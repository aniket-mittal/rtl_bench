module origen_216143 #(
    parameter DSIZE = 8,
    parameter ASIZE = 4
)(
    input  wire                  wclk,
    input  wire                  wrst,
    input  wire                  winc,
    input  wire [DSIZE-1:0]      wdata,
    output wire                  wfull,
    input  wire                  rclk,
    input  wire                  rrst,
    input  wire                  rinc,
    output wire [DSIZE-1:0]      rdata,
    output wire                  rempty
);

    reg [DSIZE-1:0] mem [(1<<ASIZE)-1:0];
    reg [ASIZE:0]   wptr, rptr;
    reg [ASIZE-1:0] wrptr1, wrptr2, wrptr3;
    reg [ASIZE-1:0] rwptr1, rwptr2, rwptr3;

    always @(posedge wclk or posedge wrst) begin
        if (wrst) begin
            wptr <= 0;
        end
        else if (winc && !wfull) begin
            mem[wptr[ASIZE-1:0]] <= wdata;
            wptr <= wptr + 1;
        end
    end

    always @(posedge rclk or posedge rrst) begin
        if (rrst) begin
            rptr <= 0;
        end
        else if (rinc && !rempty) begin
            rptr <= rptr + 1;
        end
    end

    always @(posedge wclk) begin
        wrptr1 <= wptr[ASIZE-1:0];
        wrptr2 <= wrptr1;
        wrptr3 <= wrptr2;
    end

    always @(posedge rclk) begin
        rwptr1 <= rptr[ASIZE-1:0];
        rwptr2 <= rwptr1;
        rwptr3 <= rwptr2;
    end

    assign rdata = mem[rptr[ASIZE-1:0]];
    assign rempty = (rptr[ASIZE-1:0] == rwptr3);
    assign wfull = (wptr[ASIZE-1:0] == wrptr3) && (wptr[ASIZE] != wrptr3[ASIZE-1]);

endmodule