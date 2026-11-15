module origen_198235 (
    input clk,
    input rst,
    input En,
    input Clr,
    input [31:0] RefAddr_i,
    input [31:0] rData1_i,
    input [31:0] rData2_i,
    input [31:0] Offset_i,
    input [4:0] RsAddr_i,
    input [4:0] RtAddr_i,
    input [4:0] RdAddr_i,
    output reg [31:0] RefAddr,
    output reg [31:0] rData1,
    output reg [31:0] rData2,
    output reg [31:0] Offset,
    output reg [4:0] RsAddr,
    output reg [4:0] RtAddr,
    output reg [4:0] RdAddr
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            RefAddr <= 32'd0;
            rData1 <= 32'd0;
            rData2 <= 32'd0;
            Offset <= 32'd0;
            RsAddr <= 5'd0;
            RtAddr <= 5'd0;
            RdAddr <= 5'd0;
        end
        else if (Clr) begin
            RefAddr <= 32'd0;
            rData1 <= 32'd0;
            rData2 <= 32'd0;
            Offset <= 32'd0;
            RsAddr <= 5'd0;
            RtAddr <= 5'd0;
            RdAddr <= 5'd0;
        end
        else if (En) begin
            RefAddr <= RefAddr_i;
            rData1 <= rData1_i;
            rData2 <= rData2_i;
            Offset <= Offset_i;
            RsAddr <= RsAddr_i;
            RtAddr <= RtAddr_i;
            RdAddr <= RdAddr_i;
        end
    end

endmodule