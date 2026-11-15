module origen_130872 (
    input [2:0] TRANSMIT,
    input PRL_Rx_Message_Discard,
    input Hard_Reset_received,
    input Cable_Reset_received,
    input [7:0] RetryCounter,
    input CRCReceiveTimer_Timeout,
    input GoodCRC_Response_from_PHY,
    input Message_discarded_bus_Idle,
    input [7:0] TX_BUF_HEADER_BYTE_1,
    input [7:0] RX_BUF_HEADER_BYTE_1,
    input [7:0] RX_BUF_FRAME_TYPE,
    input CLK,
    input RESET,
    output reg ALERT_TransmitSOP_MessageFailed,
    output reg ALERT_TransmitSuccessful,
    output reg MessageID_mismatch,
    output reg SOP_mismatch,
    output reg MessageID_SOP_match,
    output reg [7:0] TRANSMIT_BYTE_COUNT,
    output reg [7:0] TRANSMIT_HEADER_LOW,
    output reg [7:0] TRANSMIT_HEADER_HIGH,
    output reg [7:0] TRANSMIT_DATA_OBJECTS,
    output reg Start_CRCReceiveTimer,
    output reg Stop_CRCReceiverTimer,
    output reg MessageIDCounter,
    output reg [7:0] MessageID
);

    localparam WAIT = 3'b000;
    localparam CONSTRUCT = 3'b001;
    localparam CRC_WAIT = 3'b010;
    localparam CHECK_MATCH = 3'b011;
    localparam RETRY = 3'b100;
    localparam REPORT_FAILURE = 3'b101;
    localparam REPORT_SUCCESS = 3'b110;

    reg [2:0] state, next_state;
    reg [7:0] retry_count;
    localparam MAX_RETRY = 8'd3;

    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            state <= WAIT;
            retry_count <= 8'd0;
            MessageID <= 8'd0;
        end else begin
            state <= next_state;
            if (state == RETRY) retry_count <= retry_count + 1;
            if (state == WAIT) retry_count <= 8'd0;
            if (MessageIDCounter) MessageID <= MessageID + 1;
        end
    end

    always @(*) begin
        next_state = state;
        ALERT_TransmitSOP_MessageFailed = 1'b0;
        ALERT_TransmitSuccessful = 1'b0;
        MessageID_mismatch = 1'b0;
        SOP_mismatch = 1'b0;
        MessageID_SOP_match = 1'b0;
        TRANSMIT_BYTE_COUNT = 8'd0;
        TRANSMIT_HEADER_LOW = 8'd0;
        TRANSMIT_HEADER_HIGH = 8'd0;
        TRANSMIT_DATA_OBJECTS = 8'd0;
        Start_CRCReceiveTimer = 1'b0;
        Stop_CRCReceiverTimer = 1'b0;
        MessageIDCounter = 1'b0;

        case (state)
            WAIT: begin
                if (TRANSMIT != 3'b000) next_state = CONSTRUCT;
                if (PRL_Rx_Message_Discard || Hard_Reset_received || Cable_Reset_received) begin
                    next_state = WAIT;
                end
            end
            CONSTRUCT: begin
                TRANSMIT_BYTE_COUNT = 8'd2;
                TRANSMIT_HEADER_LOW = TX_BUF_HEADER_BYTE_1;
                TRANSMIT_HEADER_HIGH = 8'd0;
                TRANSMIT_DATA_OBJECTS = 8'd0;
                Start_CRCReceiveTimer = 1'b1;
                next_state = CRC_WAIT;
            end
            CRC_WAIT: begin
                if (GoodCRC_Response_from_PHY) next_state = CHECK_MATCH;
                if (CRCReceiveTimer_Timeout || Message_discarded_bus_Idle) next_state = RETRY;
            end
            CHECK_MATCH: begin
                MessageID_mismatch = (TX_BUF_HEADER_BYTE_1[2:0] != RX_BUF_HEADER_BYTE_1[2:0]);
                SOP_mismatch = (RX_BUF_FRAME_TYPE != 8'hE0);
                MessageID_SOP_match = !(MessageID_mismatch || SOP_mismatch);
                if (MessageID_SOP_match) next_state = REPORT_SUCCESS;
                else next_state = RETRY;
            end
            RETRY: begin
                if (retry_count >= MAX_RETRY) next_state = REPORT_FAILURE;
                else next_state = CONSTRUCT;
            end
            REPORT_FAILURE: begin
                ALERT_TransmitSOP_MessageFailed = 1'b1;
                next_state = WAIT;
            end
            REPORT_SUCCESS: begin
                ALERT_TransmitSuccessful = 1'b1;
                MessageIDCounter = 1'b1;
                Stop_CRCReceiverTimer = 1'b1;
                next_state = WAIT;
            end
        endcase
    end

endmodule