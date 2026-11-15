module sync_w2r

    #(
    parameter ASIZE = 4
    )(
    input  wire              rclk,
    input  wire              rrst_n,
    output reg  [ASIZE:0] rq2_wptr,
    input  wire [ASIZE:0] wptr
    );

    reg [ASIZE:0] rq1_wptr;

    [MASKED]

endmodule