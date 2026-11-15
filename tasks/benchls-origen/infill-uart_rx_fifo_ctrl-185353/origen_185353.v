module origen_185353 (
    input CLK,
    input RSTn,
    input RX_Done_Sig,
    input [7:0] RX_Data,
    input Full_Sig,
    output reg RX_En_Sig,
    output reg Write_Req_Sig,
    output reg [7:0] FIFO_Write_Data
);

reg [1:0] state;
reg isRX, isWrite;

[MASKED]

always @* begin
    RX_En_Sig = isRX;
    Write_Req_Sig = isWrite;
    FIFO_Write_Data = RX_Data;
end

endmodule