module origen_017210 (
    input wire clk,
    input wire rst,
    input wire bt1,
    input wire amm_rddatavalid,
    input wire [19:0] cnt,
    input wire [319:0] amm_rddata,
    output reg [319:0] amm_wrdata,
    output reg check
);

parameter burstlength = 144;

reg [319:0] wr0, wr1, wr2, wr3, wr4, wr5, wr6, wr7;
reg [319:0] rd0, rd1, rd2, rd3, rd4, rd5, rd6, rd7;

[MASKED]

always @(negedge clk) begin
    if (bt1)
        amm_wrdata <= amm_wrdata + 100;
    else
        amm_wrdata <= 320'b0;
end

endmodule