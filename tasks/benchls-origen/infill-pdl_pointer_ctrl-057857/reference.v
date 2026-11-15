module origen_057857 (
    input wire clk,
    input wire reset,
    input wire state_alu,
    input wire state_fetch,
    input wire state_read,
    input wire state_write,
    input wire [31:0] ob,
    input wire destpdlp,
    input wire destpdlx,
    input wire pdlcnt,
    input wire srcpdlidx,
    input wire srcpdlpop,
    input wire srcpdlptr,
    output reg [9:0] pdlidx,
    output reg [9:0] pdlptr,
    output wire pidrive,
    output wire ppdrive
);

    // Pointer drive signals
    assign pidrive = srcpdlidx & (state_alu | state_write | state_fetch);
    assign ppdrive = srcpdlptr & (state_alu | state_write | state_fetch);

    // pdlidx pointer logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pdlidx <= 10'b0;
        end else if (state_write & destpdlx) begin
            pdlidx <= ob[9:0];
        end
    end

    // pdlptr pointer logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pdlptr <= 10'b0;
        end else begin
            if (state_read) begin
                if (~destpdlp & pdlcnt & ~srcpdlpop) begin
                    pdlptr <= pdlptr + 1'b1;
                end
            end else if (state_fetch) begin
                if (destpdlp) begin
                    pdlptr <= ob[9:0];
                end else if (~destpdlp & pdlcnt & srcpdlpop) begin
                    pdlptr <= pdlptr - 1'b1;
                end
            end
        end
    end

endmodule