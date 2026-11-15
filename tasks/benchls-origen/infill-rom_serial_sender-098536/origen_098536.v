module origen_098536 #(
    parameter MEM_SIZE = 5,
    parameter WAIT_TIME = 100
)(
    input wire clk,
    input wire reset,
    input wire run,
    input wire ready,
    output reg send,
    output reg [7:0] data
);

    // State definitions
    localparam WAIT_RH = 2'b00;
    localparam WAIT_RL = 2'b01;
    localparam WAIT_DELAY = 2'b10;

    reg [1:0] state, next_state;
    reg [2:0] byte_addr;
    reg [6:0] wait_count;

    // ROM definition
    reg [7:0] byterom [0:MEM_SIZE-1];
    initial begin
        byterom[0] = 8'h55;
        byterom[1] = 8'hAA;
        byterom[2] = 8'h33;
        byterom[3] = 8'hCC;
        byterom[4] = 8'h5A;
    end

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= WAIT_RH;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            WAIT_RH:
                if (run && ready)
                    next_state = WAIT_RL;
                else
                    next_state = WAIT_RH;
            WAIT_RL:
                if (byte_addr == MEM_SIZE - 1)
                    next_state = WAIT_DELAY;
                else
                    next_state = WAIT_RH;
            WAIT_DELAY:
                if (wait_count == WAIT_TIME - 1)
                    next_state = WAIT_RH;
                else
                    next_state = WAIT_DELAY;
            default:
                next_state = WAIT_RH;
        endcase
    end

    // Output and internal signal logic
    [MASKED]

endmodule