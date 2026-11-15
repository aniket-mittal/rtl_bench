module origen_146319 (
    input wire clk,
    input wire reset,
    input wire cyc_i,
    input wire stb_i,
    input wire we_i,
    input wire [31:0] dat_i,
    output reg ack_o,
    output reg [31:0] dat_o
);

    // State encoding
    localparam [2:0] ICAP_IDLE = 3'b000,
                     ICAP_WR0  = 3'b001,
                     ICAP_WR1  = 3'b010,
                     ICAP_RD0  = 3'b011,
                     ICAP_RD1  = 3'b100;

    reg [2:0] icap_state, next_state;
    reg BUSY, CE, WRITE, ICAPCLK;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            icap_state <= ICAP_IDLE;
        else
            icap_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (icap_state)
            ICAP_IDLE: begin
                if (stb_i && cyc_i)
                    next_state = we_i ? ICAP_WR0 : ICAP_RD0;
                else
                    next_state = ICAP_IDLE;
            end
            ICAP_WR0: next_state = ICAP_WR1;
            ICAP_WR1: next_state = ICAP_IDLE;
            ICAP_RD0: next_state = ICAP_RD1;
            ICAP_RD1: next_state = ICAP_IDLE;
            default:  next_state = ICAP_IDLE;
        endcase
    end

    // Output logic
    [MASKED]

endmodule