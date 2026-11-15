module origen_046595 (
    input wire CLK,
    input wire RST,
    input wire VALID,
    input wire [2:0] ROM_ADDR,
    output reg CLR_CRC,
    output reg CRC_CALC,
    output reg CRC_VLD,
    output reg INC_ROM,
    output reg RST_ROM_OUT,
    output reg TX_ACK_OUT,
    output reg [2:0] FRM_STATE
);

    // State encoding
    localparam [2:0] 
        IDLE     = 3'b000,
        PREAMBLE = 3'b001,
        TX_ACK   = 3'b010,
        DATA     = 3'b011,
        CRC_EOP  = 3'b100,
        RST_ROM  = 3'b101;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge CLK or posedge RST) begin
        if (RST)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE:     next_state = VALID ? PREAMBLE : IDLE;
            PREAMBLE: next_state = (ROM_ADDR == 3'd4) ? TX_ACK : PREAMBLE;
            TX_ACK:   next_state = DATA;
            DATA:     next_state = VALID ? DATA : CRC_EOP;
            CRC_EOP:  next_state = (ROM_ADDR == 3'd7) ? RST_ROM : CRC_EOP;
            RST_ROM:  next_state = IDLE;
            default:  next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default output values
        CLR_CRC  = 1'b0;
        CRC_CALC = 1'b0;
        CRC_VLD  = 1'b0;
        INC_ROM  = 1'b0;
        RST_ROM_OUT  = 1'b0;
        TX_ACK_OUT   = 1'b0;
        FRM_STATE = current_state;

        case (current_state)
            IDLE: begin
                if (VALID) INC_ROM = 1'b1;
            end
            PREAMBLE: begin
                CLR_CRC = (ROM_ADDR == 3'd0);
                INC_ROM = 1'b1;
            end
            TX_ACK: begin
                TX_ACK_OUT = 1'b1;
            end
            DATA: begin
                if (VALID) CRC_CALC = 1'b1;
            end
            CRC_EOP: begin
                CRC_VLD = 1'b1;
                INC_ROM = 1'b1;
            end
            RST_ROM: begin
                RST_ROM_OUT = 1'b1;
            end
        endcase
    end

    // Debugging: State name (non-synthesizable)
    reg [63:0] statename;
    always @(*) begin
        case (current_state)
            IDLE:     statename = "IDLE";
            PREAMBLE: statename = "PREAMBLE";
            TX_ACK:   statename = "TX_ACK";
            DATA:     statename = "DATA";
            CRC_EOP:  statename = "CRC_EOP";
            RST_ROM:  statename = "RST_ROM";
            default:  statename = "UNKNOWN";
        endcase
    end

endmodule