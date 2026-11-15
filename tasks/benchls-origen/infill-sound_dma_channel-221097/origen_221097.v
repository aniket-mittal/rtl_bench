module origen_221097 (
    I_CLK,
    I_RSTn,
    I_H_CNT,
    I_DIV,
    I_VOL,
    I_DMA_TRIG,
    I_DMA_STOP,
    I_DMA_CHAN,
    I_DMA_ADDR,
    I_DMA_LEN,
    I_DMA_DATA,
    O_DMA_ADDR,
    O_SND
);

    input I_CLK;
    input I_RSTn;
    input [3:0] I_H_CNT;
    input [11:0] I_DIV;
    input [3:0] I_VOL;
    input I_DMA_TRIG;
    input I_DMA_STOP;
    input [2:0] I_DMA_CHAN;
    input [15:0] I_DMA_ADDR;
    input [15:0] I_DMA_LEN;
    input [15:0] I_DMA_DATA;

    output [15:0] O_DMA_ADDR;
    output [15:0] O_SND;

    reg [15:0] W_DMA_ADDR;
    reg [15:0] W_DMA_DATA;
    reg [15:0] W_DMA_CNT;
    reg W_DMA_EN;
    reg [8:0] W_VOL;
    reg [15:0] W_SAMPL;
    reg [11:0] sample;

    [MASKED]

    assign O_DMA_ADDR = W_DMA_ADDR;
    assign O_SND = $signed(W_SAMPL) * $signed(W_VOL) >>> 9;

endmodule