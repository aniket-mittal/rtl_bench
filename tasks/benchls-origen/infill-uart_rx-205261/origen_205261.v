module origen_205261(
    input RSTn,
    input BPS_CLK,
    input RX_Pin_In,
    output reg RX_En_Sig = 1'b1,
    output reg RX_Done_Sig,
    output reg [7:0] RX_Data
);

    reg [3:0] i = 4'd0;
    reg [7:0] rData = 8'b0;
    reg isDone = 1'b0;

    [MASKED]

    assign RX_Data = rData;
    assign RX_Done_Sig = isDone;

endmodule