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

always @(posedge CLK or negedge RSTn) begin
    if (!RSTn) begin
        state_index <= 4'b0;
        rData <= 10'b0;
        isSPI_Start <= 1'b0;
        isDone <= 1'b0;
    end
    else begin
        case (state_index)
            4'd0: begin
                if (Start_Sig) begin
                    state_index <= 4'd1;
                    rData <= 10'b0000000001;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd1: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd2;
                    rData <= 10'b0000000010;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd2: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd3;
                    rData <= 10'b0000000011;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd3: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd4;
                    rData <= 10'b0000000100;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd4: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd5;
                    rData <= 10'b0000000101;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd5: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd6;
                    rData <= 10'b0000000110;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd6: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd7;
                    rData <= 10'b0000000111;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd7: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd8;
                    rData <= 10'b0000001000;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd8: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd9;
                    rData <= 10'b0000001001;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd9: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd10;
                    rData <= 10'b0000001010;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd10: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd11;
                    rData <= 10'b0000001011;
                    isSPI_Start <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd11: begin
                if (SPI_Done_Sig) begin
                    state_index <= 4'd12;
                    isDone <= 1'b1;
                end
                else begin
                    isSPI_Start <= 1'b0;
                end
            end
            4'd12: begin
                state_index <= 4'b0;
                isDone <= 1'b0;
            end
            default: begin
                state_index <= 4'b0;
            end
        endcase
    end
end

always @(*) begin
    SPI_Data = rData;
    SPI_Start_Sig = isSPI_Start;
    Done_Sig = isDone;
end

endmodule