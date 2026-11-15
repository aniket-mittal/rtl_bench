module origen_061407(
    input wire clk,
    input wire clk_en,
    input wire reset,
    input wire start,
    input wire [31:0] dataa,
    input wire [31:0] datab,
    output reg [31:0] result,
    output reg done
);

    // FSM states
    localparam IDLE = 2'd0, CALCULANDO = 2'd1, PRONTO = 2'd2;
    reg [1:0] state, next_state;

    // Sub-FSM states
    localparam SUB = 2'd0, CHECK = 2'd1, ADD = 2'd2, SHIFT = 2'd3;
    reg [1:0] sub_state;

    // Internal registers
    reg [31:0] quociente, divisor;
    reg [32:0] resto;
    reg [5:0] count;

    // FSM state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else if (clk_en)
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = start ? CALCULANDO : IDLE;
            CALCULANDO: next_state = (count == 6'd33) ? PRONTO : CALCULANDO;
            PRONTO: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Main operation logic
    [MASKED]

endmodule