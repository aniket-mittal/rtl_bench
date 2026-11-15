module origen_192419 #(
    parameter WIDTH = 8,
    parameter DEPTH = 16,
    parameter T = 2
) (
    input CLK,
    input RESET,
    input [T-1:0] SECTION_SEL,
    input RD_ENB,
    input WR_ENB,
    input [WIDTH-1:0] DATA_IN,
    output [WIDTH-1:0] DATA_OUT,
    output EMPTY,
    output FULL
);

localparam ADDR_WIDTH = clogb2(DEPTH);
localparam BLOCK_SECTIONS = 2 ** T;

(* ram_style = "distributed" *) reg [WIDTH-1:0] fifo_mem [DEPTH*BLOCK_SECTIONS-1:0];
reg [ADDR_WIDTH-1:0] rd_counter, wr_counter;
reg [$clog2(DEPTH+1)-1:0] ele_count;

function integer clogb2;
    input [31:0] value;
    begin
        value = value - 1;
        for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1)
            value = value >> 1;
    end
endfunction

assign DATA_OUT = fifo_mem[{SECTION_SEL, rd_counter}];
assign EMPTY = (ele_count == 0);
assign FULL = (ele_count == DEPTH);

always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
        rd_counter <= 0;
        wr_counter <= 0;
        ele_count <= 0;
    end
    else begin
        if (RD_ENB && !EMPTY) begin
            rd_counter <= rd_counter + 1;
            ele_count <= ele_count - 1;
        end
        if (WR_ENB && !FULL) begin
            fifo_mem[{SECTION_SEL, wr_counter}] <= DATA_IN;
            wr_counter <= wr_counter + 1;
            ele_count <= ele_count + 1;
        end
    end
end

endmodule