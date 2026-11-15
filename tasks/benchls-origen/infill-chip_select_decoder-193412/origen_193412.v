module origen_193412(
    input enable,
    input clk,
    input [7:0] addr_in,
    output reg csunmap,
    output reg csram1,
    output reg csram2,
    output reg csrom,
    output reg csio,
    output reg csgfx,
    output reg csctrl,
    output reg cspgtbl,
    output reg pas
);

    reg enable_r;

    always @(posedge clk) begin
        enable_r <= enable;
    end

    [MASKED]

    assign pas = enable_r;
endmodule