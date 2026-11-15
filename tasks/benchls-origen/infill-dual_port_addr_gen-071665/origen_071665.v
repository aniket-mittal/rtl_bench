module origen_071665 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] datain,
    input wire readyb0,
    input wire readya1,
    output reg [7:0] dataout,
    output reg [6:0] addrb0,
    output reg [6:0] addra1,
    output reg wea,
    output reg finishb0,
    output reg finisha1
);

parameter DATALENGTH = 8;

reg [6:0] addrb0_next;
reg wea_stage1, wea_stage2;

[MASKED]

always @(*) begin
    if (readyb0 & readya1) begin
        addrb0_next = (addrb0 == DATALENGTH - 1) ? 7'b0 : addrb0 + 1;
    end else begin
        addrb0_next = addrb0;
    end
end

endmodule