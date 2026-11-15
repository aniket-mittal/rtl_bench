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

    always @(posedge I_CLK or negedge I_RSTn) begin
        if (!I_RSTn) begin
            W_DMA_ADDR <= 16'b0;
            W_DMA_DATA <= 16'b0;
            W_DMA_CNT <= 16'b0;
            W_DMA_EN <= 1'b0;
            W_VOL <= 9'b0;
            W_SAMPL <= 16'b0;
            sample <= 12'b0;
        end else begin
            if (I_DMA_TRIG) begin
                W_DMA_ADDR <= I_DMA_ADDR;
                W_DMA_EN <= 1'b1;
            end

            if (W_DMA_EN) begin
                W_DMA_DATA <= I_DMA_DATA;
                W_DMA_CNT <= W_DMA_CNT + 16'b1;

                if (W_DMA_CNT == I_DMA_LEN || I_DMA_STOP) begin
                    W_DMA_EN <= 1'b0;
                end
            end

            if (sample == I_DIV - 1) begin
                W_SAMPL <= {8'b0, W_DMA_DATA[7:0]};
                W_DMA_ADDR <= W_DMA_ADDR + 16'b1;
                W_DMA_CNT <= W_DMA_CNT - 16'b1;
                sample <= 12'b0;
            end else begin
                sample <= sample + 12'b1;
            end

            case (I_VOL)
                4'b0000: W_VOL <= 9'b000000000;
                4'b0001: W_VOL <= 9'b000000100;
                4'b0010: W_VOL <= 9'b000001000;
                4'b0011: W_VOL <= 9'b000001100;
                4'b0100: W_VOL <= 9'b000010000;
                4'b0101: W_VOL <= 9'b000010100;
                4'b0110: W_VOL <= 9'b000011000;
                4'b0111: W_VOL <= 9'b000011100;
                4'b1000: W_VOL <= 9'b000100000;
                4'b1001: W_VOL <= 9'b000100100;
                4'b1010: W_VOL <= 9'b000101000;
                4'b1011: W_VOL <= 9'b000101100;
                4'b1100: W_VOL <= 9'b000110000;
                4'b1101: W_VOL <= 9'b000110100;
                4'b1110: W_VOL <= 9'b000111000;
                4'b1111: W_VOL <= 9'b000111100;
            endcase
        end
    end

    assign O_DMA_ADDR = W_DMA_ADDR;
    assign O_SND = $signed(W_SAMPL) * $signed(W_VOL) >>> 9;

endmodule