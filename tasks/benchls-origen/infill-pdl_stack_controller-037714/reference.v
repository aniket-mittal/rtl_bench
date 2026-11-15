module origen_037714 (
    input wire clk,
    input wire reset,
    input wire [31:0] ir,
    input wire state_alu,
    input wire state_fetch,
    input wire state_mmu,
    input wire state_read,
    input wire state_write,
    input wire destpdltop,
    input wire destpdl_x,
    input wire destpdl_p,
    input wire srcpdlpop,
    input wire srcpdltop,
    input wire [4:0] pdlptr,
    input wire [4:0] pdlidx,
    output wire [4:0] pdla,
    output wire pdlwrite,
    output wire pwp,
    output wire pdlenb,
    output wire prp,
    output wire pdldrive,
    output wire pdlcnt
);

    reg [4:0] pwidx;
    wire pdlp;

    // PDL addressing
    assign pdlp = state_read ? ir[30] : pwidx;
    assign pdla = pdlp ? pdlptr : pdlidx;

    // PDL write control
    assign pdlwrite = destpdltop | destpdl_x | destpdl_p;
    assign pwp = state_write & pdlwrite;

    // PDL read control
    assign pdlenb = srcpdlpop | srcpdltop;
    assign prp = state_read & pdlenb;

    // PDL drive control
    assign pdldrive = pdlenb & (state_alu | state_write | state_mmu | state_fetch);

    // PDL count control
    assign pdlcnt = (srcpdlpop & ~ir[31]) | destpdl_p;

    // Index control
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pwidx <= 5'b0;
        end else if (state_alu | state_write) begin
            pwidx <= destpdl_x ? ir[29:25] : pwidx;
        end
    end

endmodule