module origen_119880 #(
    parameter N = 16,
    parameter M = 4,
    parameter T = 32,
    parameter Cb = 5,
    parameter MODE = 0
)(
    input wire clk,
    input wire nR,
    input wire newIN,
    input wire [4*N-1:0] in,
    input wire loadData,
    input wire loadKey,
    input wire doneData,
    input wire doneKey,
    output reg loadPkt,
    output reg donePkt,
    output reg [7:0] infoIN,
    output reg [Cb-1:0] countIN,
    output reg newKey,
    output reg newData,
    output reg enc_dec,
    output reg [N-1:0] blockIN,
    output reg [M*N-1:0] KEY
);

    // FSM states
    localparam WAIT = 2'b00, LOAD = 2'b01, COMPUTE = 2'b10, WRITE = 2'b11;
    reg [1:0] state, next_state;

    // Internal registers
    reg [4*N-1:0] data_reg;
    reg [Cb-1:0] count_reg;
    reg [7:0] info_reg;
    reg [1:0] nBLOCK;

    // FSM state transition
    always @(posedge clk or negedge nR) begin
        if (~nR)
            state <= WAIT;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            WAIT: next_state = newIN ? LOAD : WAIT;
            LOAD: next_state = COMPUTE;
            COMPUTE: next_state = WRITE;
            WRITE: next_state = WAIT;
            default: next_state = WAIT;
        endcase
    end

    // Main logic
    [MASKED]

endmodule