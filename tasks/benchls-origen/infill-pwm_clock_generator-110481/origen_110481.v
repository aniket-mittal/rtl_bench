module origen_110481 (
    input wire ref_clk,
    input wire rst,
    input wire cpu_clk,
    input wire [2:0] n,
    input wire LdCnt,
    input wire counten,
    output reg kcalc,
    output reg tff_out,
    output wire cout,
    output wire [7:0] k
);

    reg [7:0] duration;
    reg old_cpu_clk;
    reg [7:0] cnt;

    wire rising_edge = cpu_clk && !old_cpu_clk;
    wire falling_edge = !cpu_clk && old_cpu_clk;

    assign k = (duration << 1) >> n;
    assign cout = (cnt == 8'hFF);

    [MASKED]

endmodule