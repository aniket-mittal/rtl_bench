module origen_170128(
    input CLK,
    input RSTn,
    input Start_Sig,
    input SPI_Done_Sig,
    output reg SPI_Start_Sig,
    output reg [9:0] SPI_Data,
    output reg Done_Sig
);

reg [3:0] state_index;
reg [9:0] rData;
reg isSPI_Start;
reg isDone;

[MASKED]

always @(*) begin
    SPI_Data = rData;
    SPI_Start_Sig = isSPI_Start;
    Done_Sig = isDone;
end

endmodule