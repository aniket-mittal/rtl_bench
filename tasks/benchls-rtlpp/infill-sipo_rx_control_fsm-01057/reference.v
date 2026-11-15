module rtlpp_01057(
    input clk,
    input full,
    input Done,
    input reset,
    input tx_out,
    output reg Wr,
    output reg EnRx,
    output reg En_valadation,
    output reg SIPO_reset,
    output reg EnDec
);

    // Define state constants
    parameter START_RX    = 3'b000;
    parameter SIPO_WRITE  = 3'b001;
    parameter WAIT_UNDONE = 3'b010;
    parameter EN_COMB     = 3'b011;
    parameter IDEL        = 3'b100;

    // Define state register
    reg [2:0] state;

    // Initial state
    initial state = IDEL;

    // State machine
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= START_RX;
            Wr <= 0;
            EnRx <= 0;
            En_valadation <= 0;
            SIPO_reset <= 0;
            EnDec <= 0;
        end else begin
            case (state)
                START_RX: begin
                    Wr <= 0;
                    EnRx <= 1;
                    En_valadation <= 1;
                    SIPO_reset <= 0;
                    EnDec <= 0;
                    state <= (Done) ? SIPO_WRITE : START_RX;
                end
                SIPO_WRITE: begin
                    Wr <= 1;
                    EnRx <= 1;
                    En_valadation <= 1;
                    SIPO_reset <= 0;
                    EnDec <= 0;
                    state <= (full) ? EN_COMB : WAIT_UNDONE;
                end
                WAIT_UNDONE: begin
                    Wr <= 0;
                    EnRx <= 1;
                    En_valadation <= 1;
                    SIPO_reset <= 0;
                    EnDec <= 0;
                    state <= (!Done) ? START_RX : WAIT_UNDONE;
                end
                EN_COMB: begin
                    Wr <= 0;
                    EnRx <= 0;
                    En_valadation <= 1;
                    SIPO_reset <= 0;
                    EnDec <= 1;
                    state <= IDEL;
                end
                IDEL: begin
                    Wr <= 0;
                    EnRx <= 0;
                    En_valadation <= 1;
                    SIPO_reset <= 0;
                    EnDec <= 1;
                    state <= (!tx_out) ? START_RX : IDEL;
                end
                default: state <= IDEL;
            endcase
        end
    end
endmodule