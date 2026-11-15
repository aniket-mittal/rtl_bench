module origen_116460 (
    input wire clk,
    input wire reset_n,
    input wire start,
    input wire [31:0] a_in,
    input wire [31:0] b_in,
    output reg [31:0] result,
    output reg done
);

    // State definitions
    localparam IDLE = 2'b00, RUN = 2'b01, DONE = 2'b10;
    localparam LOAD = 2'b00, SWAP = 2'b01, SUB = 2'b10, HOLD = 2'b11;

    // Registers and wires
    reg [1:0] gcd_ps, gcd_ns;
    reg [1:0] a_state, b_state;
    reg [31:0] a_reg, b_reg;
    wire a_lt_b, b_neq_zero;

    // Combinational logic
    assign a_lt_b = (a_reg < b_reg);
    assign b_neq_zero = (b_reg != 0);

    // Main FSM
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            gcd_ps <= IDLE;
        else
            gcd_ps <= gcd_ns;
    end

    always @(*) begin
        case (gcd_ps)
            IDLE: gcd_ns = start ? RUN : IDLE;
            RUN: gcd_ns = b_neq_zero ? RUN : DONE;
            DONE: gcd_ns = IDLE;
            default: gcd_ns = IDLE;
        endcase
    end

    // a_reg state machine
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            a_state <= LOAD;
        else begin
            case (a_state)
                LOAD: a_state <= (gcd_ps == RUN) ? (a_lt_b ? SWAP : SUB) : LOAD;
                SWAP: a_state <= SUB;
                SUB: a_state <= (gcd_ps == RUN) ? (a_lt_b ? SWAP : SUB) : HOLD;
                HOLD: a_state <= (gcd_ps == IDLE) ? LOAD : HOLD;
            endcase
        end
    end

    // b_reg state machine
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            b_state <= LOAD;
        else begin
            case (b_state)
                LOAD: b_state <= (gcd_ps == RUN) ? (a_lt_b ? SUB : SWAP) : LOAD;
                SWAP: b_state <= SUB;
                SUB: b_state <= (gcd_ps == RUN) ? (a_lt_b ? SUB : SWAP) : HOLD;
                HOLD: b_state <= (gcd_ps == IDLE) ? LOAD : HOLD;
            endcase
        end
    end

    // Register operations
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            a_reg <= 32'b0;
            b_reg <= 32'b0;
        end else begin
            case (a_state)
                LOAD: a_reg <= a_in;
                SWAP: a_reg <= b_reg;
                SUB: a_reg <= a_reg - b_reg;
                HOLD: a_reg <= a_reg;
            endcase

            case (b_state)
                LOAD: b_reg <= b_in;
                SWAP: b_reg <= a_reg;
                SUB: b_reg <= (a_lt_b) ? b_reg - a_reg : b_reg;
                HOLD: b_reg <= b_reg;
            endcase
        end
    end

    // Output logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            result <= 32'b0;
            done <= 1'b0;
        end else begin
            result <= (gcd_ps == DONE) ? a_reg : result;
            done <= (gcd_ps == DONE);
        end
    end

endmodule