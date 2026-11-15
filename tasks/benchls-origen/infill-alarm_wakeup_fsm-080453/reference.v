module origen_080453(
    input wire alarme,
    input wire dia_util,
    input wire clock,
    input wire reset,
    output reg desligar
);

    // State encoding
    localparam DORMINDO = 2'b00;
    localparam ACORDADO = 2'b01;
    localparam LEVANTADO = 2'b10;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clock or posedge reset) begin
        if (reset)
            state <= DORMINDO;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state; // Default: stay in current state
        case (state)
            DORMINDO: begin
                if (alarme)
                    next_state = ACORDADO;
            end
            ACORDADO: begin
                if (dia_util)
                    next_state = LEVANTADO;
                else
                    next_state = DORMINDO;
            end
            LEVANTADO: begin
                // No transitions defined for LEVANTADO state
            end
            default: next_state = DORMINDO;
        endcase
    end

    // Output logic
    always @(posedge clock or posedge reset) begin
        if (reset)
            desligar <= 1'b0;
        else if (state == ACORDADO)
            desligar <= 1'b1;
        else
            desligar <= 1'b0;
    end

endmodule