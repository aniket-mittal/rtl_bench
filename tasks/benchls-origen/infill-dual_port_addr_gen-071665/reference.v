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

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        addrb0 <= 7'b0;
        addra1 <= 7'b0;
        dataout <= 8'b0;
        wea <= 1'b0;
        finishb0 <= 1'b0;
        finisha1 <= 1'b0;
        wea_stage1 <= 1'b0;
        wea_stage2 <= 1'b0;
    end else begin
        addrb0 <= addrb0_next;
        addra1 <= addrb0;
        dataout <= datain + 1;
        wea <= wea_stage2;
        wea_stage2 <= wea_stage1;
        wea_stage1 <= readyb0 & readya1;
        
        if (addrb0 == DATALENGTH - 1) begin
            finishb0 <= ~finishb0;
        end
        
        if (addra1 == DATALENGTH - 1) begin
            finisha1 <= ~finisha1;
        end
    end
end

always @(*) begin
    if (readyb0 & readya1) begin
        addrb0_next = (addrb0 == DATALENGTH - 1) ? 7'b0 : addrb0 + 1;
    end else begin
        addrb0_next = addrb0;
    end
end

endmodule