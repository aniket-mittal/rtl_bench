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

always @(posedge CLK or negedge RSTn) begin
    if (~RSTn) begin
        state <= 2'b00;
        isRX <= 1'b0;
        isWrite <= 1'b0;
    end
    else begin
        case (state)
            2'b00: begin // State 0 (Initial State)
                isRX <= 1'b1;
                if (RX_Done_Sig) begin
                    isRX <= 1'b0;
                    state <= 2'b01;
                end
            end
            2'b01: begin // State 1
                if (~Full_Sig) begin
                    state <= 2'b10;
                end
            end
            2'b10: begin // State 2
                isWrite <= 1'b1;
                state <= 2'b11;
            end
            2'b11: begin // State 3
                isWrite <= 1'b0;
                state <= 2'b00;
            end
        endcase
    end
end

always @* begin
    RX_En_Sig = isRX;
    Write_Req_Sig = isWrite;
    FIFO_Write_Data = RX_Data;
end

endmodule