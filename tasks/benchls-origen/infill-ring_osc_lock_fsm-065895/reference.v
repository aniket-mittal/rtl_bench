module origen_065895 #(
    parameter CSCntLen = 8,
    parameter CSCntThreshL = 8'h80,
    parameter CSCntThreshH = 8'hFF,
    parameter NBSamples = 8,
    parameter samplesMin = 6,
    parameter ROSelLen = 3,
    parameter lockCntLen = 16
) (
    input wire clk,
    input wire rst,
    input wire [CSCntLen-1:0] CSCnt,
    input wire CSReq,
    output reg [ROSelLen-1:0] RO0Sel,
    output reg [ROSelLen-1:0] RO1Sel,
    output reg CSAck,
    output reg matched,
    output reg noFound,
    output reg locked
);

    reg [CSCntLen-1:0] CSCntSample;
    reg [3:0] sampleCnt;
    reg [3:0] goodSampleCnt;
    reg [ROSelLen-1:0] ROSel;
    reg [lockCntLen-1:0] lockCnt;

    localparam IDLE = 2'b00, SAMPLING = 2'b01, MATCHING = 2'b10, LOCKED = 2'b11;
    reg [1:0] state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            CSCntSample <= 0;
            sampleCnt <= 0;
            goodSampleCnt <= 0;
            ROSel <= 0;
            lockCnt <= 0;
            RO0Sel <= 0;
            RO1Sel <= 0;
            CSAck <= 0;
            matched <= 0;
            noFound <= 0;
            locked <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (CSReq) begin
                        state <= SAMPLING;
                        CSCntSample <= CSCnt;
                        CSAck <= 1;
                    end else begin
                        lockCnt <= (lockCnt == {lockCntLen{1'b1}}) ? lockCnt : lockCnt + 1;
                        if (lockCnt == {lockCntLen{1'b1}}) begin
                            state <= LOCKED;
                            locked <= 1;
                        end
                    end
                end

                SAMPLING: begin
                    if (!CSReq) begin
                        state <= MATCHING;
                        CSAck <= 0;
                        if (CSCntSample >= CSCntThreshL && CSCntSample <= CSCntThreshH) begin
                            goodSampleCnt <= goodSampleCnt + 1;
                        end
                        sampleCnt <= sampleCnt + 1;
                    end
                end

                MATCHING: begin
                    if (sampleCnt == NBSamples) begin
                        if (goodSampleCnt >= samplesMin) begin
                            matched <= 1;
                            state <= IDLE;
                        end else begin
                            if (ROSel == {ROSelLen{1'b1}}) begin
                                noFound <= 1;
                                state <= IDLE;
                            end else begin
                                ROSel <= ROSel + 1;
                                state <= IDLE;
                            end
                        end
                        sampleCnt <= 0;
                        goodSampleCnt <= 0;
                    end else if (CSReq) begin
                        state <= SAMPLING;
                        CSCntSample <= CSCnt;
                        CSAck <= 1;
                    end
                end

                LOCKED: begin
                    if (!CSReq) begin
                        locked <= 0;
                        ROSel <= ROSel + 1;
                        state <= IDLE;
                    end
                end
            endcase

            RO0Sel <= ROSel;
            RO1Sel <= ~ROSel;
        end
    end

endmodule