module origen_015395 (
    input wire clk,
    input wire rst,
    input wire en,
    input wire wen,
    input wire [20:0] wdata,
    output reg [20:0] rdata,
    input wire [31:0] addr,
    output reg hit,
    output wire valid,
    output reg work,
    input wire op
);

reg [31:0] addr_r;
reg [6:0] rst_cnt;
reg [20:0] tag_ram [127:0];
reg [20:0] tag_read;

[MASKED]

assign valid = rdata[20];

integer i;
initial begin
    for (i = 0; i < 128; i = i + 1) begin
        tag_ram[i] = 21'b0;
    end
end

endmodule