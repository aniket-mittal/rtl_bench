module origen_156837(
    input clk,
    input rst,
    input [1:0] currEndP,
    input NAKSent,
    input stallSent,
    input CRCError,
    input bitStuffError,
    input RxOverflow,
    input RxTimeOut,
    input dataSequence,
    input ACKRxed,
    input [1:0] transType,
    input [1:0] transTypeNAK,
    input endPMuxErrorsWEn,
    input clrEPRdy,
    output reg [3:0] endPControlReg,
    output reg [3:0] endP0StatusReg,
    output reg [3:0] endP1StatusReg,
    output reg [3:0] endP2StatusReg,
    output reg [3:0] endP3StatusReg,
    output reg [1:0] endP0TransTypeReg,
    output reg [1:0] endP1TransTypeReg,
    output reg [1:0] endP2TransTypeReg,
    output reg [1:0] endP3TransTypeReg,
    output reg [1:0] endP0NAKTransTypeReg,
    output reg [1:0] endP1NAKTransTypeReg,
    output reg [1:0] endP2NAKTransTypeReg,
    output reg [1:0] endP3NAKTransTypeReg,
    output reg clrEP0Rdy,
    output reg clrEP1Rdy,
    output reg clrEP2Rdy,
    output reg clrEP3Rdy
);

    wire endPStatusCombine;
    assign endPStatusCombine = dataSequence | ACKRxed | stallSent | RxTimeOut | RxOverflow | bitStuffError | CRCError;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            endP0StatusReg <= 4'b0;
            endP1StatusReg <= 4'b0;
            endP2StatusReg <= 4'b0;
            endP3StatusReg <= 4'b0;
            endP0TransTypeReg <= 2'b0;
            endP1TransTypeReg <= 2'b0;
            endP2TransTypeReg <= 2'b0;
            endP3TransTypeReg <= 2'b0;
            endP0NAKTransTypeReg <= 2'b0;
            endP1NAKTransTypeReg <= 2'b0;
            endP2NAKTransTypeReg <= 2'b0;
            endP3NAKTransTypeReg <= 2'b0;
        end
        else if (endPMuxErrorsWEn) begin
            case (currEndP)
                2'b00: begin
                    endP0StatusReg <= {dataSequence, ACKRxed, stallSent, RxTimeOut | RxOverflow | bitStuffError | CRCError};
                    endP0TransTypeReg <= transType;
                    endP0NAKTransTypeReg <= transTypeNAK;
                end
                2'b01: begin
                    endP1StatusReg <= {dataSequence, ACKRxed, stallSent, RxTimeOut | RxOverflow | bitStuffError | CRCError};
                    endP1TransTypeReg <= transType;
                    endP1NAKTransTypeReg <= transTypeNAK;
                end
                2'b10: begin
                    endP2StatusReg <= {dataSequence, ACKRxed, stallSent, RxTimeOut | RxOverflow | bitStuffError | CRCError};
                    endP2TransTypeReg <= transType;
                    endP2NAKTransTypeReg <= transTypeNAK;
                end
                2'b11: begin
                    endP3StatusReg <= {dataSequence, ACKRxed, stallSent, RxTimeOut | RxOverflow | bitStuffError | CRCError};
                    endP3TransTypeReg <= transType;
                    endP3NAKTransTypeReg <= transTypeNAK;
                end
            endcase
        end
    end

    always @(*) begin
        case (currEndP)
            2'b00: begin
                endPControlReg = 4'b0001;
                clrEP0Rdy = clrEPRdy;
                clrEP1Rdy = 1'b0;
                clrEP2Rdy = 1'b0;
                clrEP3Rdy = 1'b0;
            end
            2'b01: begin
                endPControlReg = 4'b0010;
                clrEP0Rdy = 1'b0;
                clrEP1Rdy = clrEPRdy;
                clrEP2Rdy = 1'b0;
                clrEP3Rdy = 1'b0;
            end
            2'b10: begin
                endPControlReg = 4'b0100;
                clrEP0Rdy = 1'b0;
                clrEP1Rdy = 1'b0;
                clrEP2Rdy = clrEPRdy;
                clrEP3Rdy = 1'b0;
            end
            2'b11: begin
                endPControlReg = 4'b1000;
                clrEP0Rdy = 1'b0;
                clrEP1Rdy = 1'b0;
                clrEP2Rdy = 1'b0;
                clrEP3Rdy = clrEPRdy;
            end
        endcase
    end

endmodule