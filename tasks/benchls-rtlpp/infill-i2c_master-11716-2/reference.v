module rtlpp_11716 (
    input clk,
    input sdaIn,
    input enable,
    input [1:0] instruction,
    input [7:0] dataIn,
    output reg sdaOut = 1,
    output reg scl = 1,
    output reg isSending = 0,
    output reg [7:0] byteToSend,
    output reg [7:0] byteReceived = 0,
    output reg complete
    );

    localparam START_TX = 0;
    localparam STOP_TX = 1;
    localparam READ_BYTE = 2;
    localparam WRITE_BYTE = 3;
    localparam STATE_IDLE = 4;
    localparam STATE_DONE = 5;
    localparam SEND_ACK = 6;
    localparam RCV_ACK = 7;

    reg [6:0] clockDivider = 0;
    reg [2:0] state = STATE_IDLE;
    reg [2:0] bitToSend = 0;

    always @(posedge clk) begin
        case (state) 
            STATE_IDLE: begin
                if(enable) begin
                    complete <= 0;
                    clockDivider <= 0;
                    bitToSend <= 0;
                    state <= {1'b0, instruction};
                end
            end

            START_TX: begin
                isSending <= 1;
                clockDivider <= clockDivider + 1;
                
                if(clockDivider[6:5] == 2'b00) begin
                    scl <= 1;
                    sdaOut <= 1;
                end else if(clockDivider[6:5] == 2'b01) begin
                    sdaOut <= 0;
                end else if(clockDivider[6:5] == 2'b10) begin
                    scl <= 0;
                end else if(clockDivider[6:5] == 2'b11) begin
                    state <= STATE_DONE;
                end
            end

            STOP_TX: begin
                isSending <= 1;
                clockDivider <= clockDivider + 1;

                if(clockDivider[6:5] == 2'b00) begin
                    scl <= 0;
                    sdaOut <= 0;
                end else if(clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if(clockDivider[6:5] == 2'b10) begin
                    sdaOut <= 1;
                end else if(clockDivider[6:5] == 2'b11) begin
                    state <= STATE_DONE;
                end
            end

            READ_BYTE: begin
                isSending <= 0;
                clockDivider <= clockDivider + 1;

                if(clockDivider[6:5] == 2'b00) begin
                    scl <= 0;
                end else if(clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if(clockDivider == 7'b1000000) begin
                    byteReceived <= {byteReceived[6:0], sdaIn ? 1'b1 : 1'b0};
                end else if(clockDivider == 7'b1111111) begin
                    bitToSend <= bitToSend + 1;
                    if (bitToSend == 3'b111) begin
                        state <= SEND_ACK;  
                    end
                end else if(clockDivider[6:5] == 2'b11) begin
                    scl <= 0;
                end
            end

            SEND_ACK: begin
                isSending <= 1;
                sdaOut <= 0;
                clockDivider <= clockDivider + 1;

                if (clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if(clockDivider[6:5] == 2'b10) begin
                    scl <= 0;
                    state <= STATE_DONE;
                end
            end

            STATE_DONE: begin
                complete <= 1;
                isSending <= 0;
                state <= STATE_IDLE;
            end
        endcase
    end
endmodule