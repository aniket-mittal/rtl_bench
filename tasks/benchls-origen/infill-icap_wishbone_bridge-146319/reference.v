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
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            BUSY <= 1'b0;
            CE <= 1'b0;
            WRITE <= 1'b0;
            ICAPCLK <= 1'b0;
            ack_o <= 1'b0;
            dat_o <= 32'b0;
        end else begin
            case (icap_state)
                ICAP_IDLE: begin
                    BUSY <= 1'b0;
                    CE <= 1'b0;
                    WRITE <= 1'b0;
                    ICAPCLK <= 1'b0;
                    ack_o <= 1'b0;
                end
                ICAP_WR0: begin
                    BUSY <= 1'b1;
                    CE <= 1'b1;
                    WRITE <= 1'b1;
                    ICAPCLK <= 1'b1;
                    ack_o <= 1'b0;
                end
                ICAP_WR1: begin
                    BUSY <= 1'b1;
                    CE <= 1'b1;
                    WRITE <= 1'b1;
                    ICAPCLK <= 1'b0;
                    ack_o <= 1'b1;
                end
                ICAP_RD0: begin
                    BUSY <= 1'b1;
                    CE <= 1'b1;
                    WRITE <= 1'b0;
                    ICAPCLK <= 1'b1;
                    ack_o <= 1'b0;
                end
                ICAP_RD1: begin
                    BUSY <= 1'b1;
                    CE <= 1'b1;
                    WRITE <= 1'b0;
                    ICAPCLK <= 1'b0;
                    ack_o <= 1'b1;
                    dat_o <= dat_i; // Assuming dat_i contains the read data
                end
            endcase
        end
    end

endmodule