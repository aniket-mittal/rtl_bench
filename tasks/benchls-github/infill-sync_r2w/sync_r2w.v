module sync_r2w

    #(
    parameter ASIZE = 4
    )(
    input  wire              wclk,
    input  wire              wrst_n,
    input  wire [ASIZE:0] rptr,
    output reg  [ASIZE:0] wq2_rptr
    );

    reg [ASIZE:0] wq1_rptr;

    [MASKED]

endmodule