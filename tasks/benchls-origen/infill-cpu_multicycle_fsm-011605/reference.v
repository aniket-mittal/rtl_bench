module origen_011605 (
    input wire clk,
    input wire reset,
    input wire [11:0] codif,
    input wire busy_mem,
    input wire done_mem,
    input wire aligned_mem,
    input wire done_exec,
    input wire is_exec,
    output reg [1:0] W_R_mem,
    output reg [1:0] wordsize_mem,
    output reg sign_mem,
    output reg en_mem,
    output reg enable_exec,
    output reg enable_exec_mem,
    output reg trap,
    output reg enable_pc
);

    // State encoding
    localparam [2:0] S0_fetch = 3'b000,
                     SW0_fetch_wait = 3'b001,
                     S1_decode = 3'b010,
                     S2_exec = 3'b011,
                     S3_memory = 3'b100,
                     SW3_mem_wait = 3'b101,
                     S4_trap = 3'b110;

    reg [2:0] current_state, next_state;
    reg err;

    // State transition logic
    always @(posedge clk or negedge reset) begin
        if (!reset)
            current_state <= S0_fetch;
        else
            current_state <= next_state;
    end

    // Next state and output logic
    always @(*) begin
        // Default output values
        W_R_mem = 2'b00;
        wordsize_mem = 2'b00;
        sign_mem = 1'b0;
        en_mem = 1'b0;
        enable_exec = 1'b0;
        enable_exec_mem = 1'b0;
        trap = 1'b0;
        enable_pc = 1'b0;
        err = 1'b0;
        next_state = current_state;

        case (current_state)
            S0_fetch: begin
                en_mem = 1'b1;
                W_R_mem = 2'b01; // Read
                next_state = SW0_fetch_wait;
            end

            SW0_fetch_wait: begin
                if (!busy_mem && done_mem)
                    next_state = S1_decode;
            end

            S1_decode: begin
                if (is_exec)
                    next_state = S2_exec;
                else
                    next_state = S3_memory;
            end

            S2_exec: begin
                enable_exec = 1'b1;
                if (done_exec) begin
                    enable_pc = 1'b1;
                    next_state = S0_fetch;
                end
            end

            S3_memory: begin
                en_mem = 1'b1;
                W_R_mem = codif[11:10];
                wordsize_mem = codif[9:8];
                sign_mem = codif[7];
                if (!aligned_mem)
                    err = 1'b1;
                next_state = SW3_mem_wait;
            end

            SW3_mem_wait: begin
                if (err)
                    next_state = S4_trap;
                else if (!busy_mem && done_mem) begin
                    enable_exec_mem = 1'b1;
                    enable_pc = 1'b1;
                    next_state = S0_fetch;
                end
            end

            S4_trap: begin
                trap = 1'b1;
                // Stay in trap state until reset
            end

            default: next_state = S0_fetch;
        endcase
    end

endmodule