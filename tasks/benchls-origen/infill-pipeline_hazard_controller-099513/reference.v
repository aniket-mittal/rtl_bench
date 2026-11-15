module origen_099513 (
    input wire clk,
    input wire [4:0] reg_a, reg_b, reg_wb, reg_ex,
    input wire reg_wb_en, reg_ex_en,
    input wire [3:0] instr_type,
    input wire branch_taken,
    input wire reset,
    input wire interrupt, interrupt_flag,
    input wire a_read, b_read,
    output reg imem_addr_mux,
    output reg fetch_latch_stall,
    output reg dec_nop,
    output reg dec_int,
    output reg pc_inc, pc_load, pc_reset,
    output reg pc_mux_override
);

    reg [3:0] current_state, next_state;

    // State definitions
    localparam [3:0]
        CHECK = 4'd0,
        RAW_EX = 4'd1,
        BRANCH_MIS0 = 4'd2,
        BRANCH_MIS1 = 4'd3,
        INT0 = 4'd4,
        INT1 = 4'd5,
        INT2 = 4'd6,
        RESET0 = 4'd7,
        RESET1 = 4'd8,
        CALL0 = 4'd9,
        CALL1 = 4'd10,
        RETURN0 = 4'd11,
        RETURN1 = 4'd12;

    // State machine
    always @(posedge clk) begin
        if (reset)
            current_state <= RESET0;
        else
            current_state <= next_state;
    end

    // Combinational logic for next state and outputs
    always @(*) begin
        // Default output values
        imem_addr_mux = 1'b0;
        fetch_latch_stall = 1'b0;
        dec_nop = 1'b0;
        dec_int = 1'b0;
        pc_inc = 1'b1;
        pc_load = 1'b0;
        pc_reset = 1'b0;
        pc_mux_override = 1'b0;

        next_state = CHECK;

        case (current_state)
            CHECK: begin
                if (reset)
                    next_state = RESET0;
                else if (interrupt && interrupt_flag)
                    next_state = INT0;
                else if (branch_taken)
                    next_state = BRANCH_MIS0;
                else if ((reg_ex_en && ((a_read && reg_a == reg_ex) || (b_read && reg_b == reg_ex))) ||
                         (reg_wb_en && ((a_read && reg_a == reg_wb) || (b_read && reg_b == reg_wb))))
                    next_state = RAW_EX;
                else if (instr_type == 4'h6)
                    next_state = CALL0;
                else if (instr_type == 4'h7 || instr_type == 4'h8 || instr_type == 4'h9)
                    next_state = RETURN0;
            end

            RAW_EX: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                pc_inc = 1'b0;
                next_state = CHECK;
            end

            BRANCH_MIS0: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                pc_inc = 1'b0;
                pc_load = 1'b1;
                next_state = BRANCH_MIS1;
            end

            BRANCH_MIS1: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                next_state = CHECK;
            end

            INT0: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                pc_inc = 1'b0;
                next_state = INT1;
            end

            INT1: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                pc_inc = 1'b0;
                next_state = INT2;
            end

            INT2: begin
                fetch_latch_stall = 1'b1;
                dec_int = 1'b1;
                pc_load = 1'b1;
                pc_mux_override = 1'b1;
                next_state = CHECK;
            end

            RESET0: begin
                pc_reset = 1'b1;
                pc_inc = 1'b0;
                next_state = RESET1;
            end

            RESET1: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                next_state = CHECK;
            end

            CALL0: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                pc_inc = 1'b0;
                next_state = CALL1;
            end

            CALL1: begin
                pc_load = 1'b1;
                next_state = CHECK;
            end

            RETURN0: begin
                fetch_latch_stall = 1'b1;
                dec_nop = 1'b1;
                pc_inc = 1'b0;
                next_state = RETURN1;
            end

            RETURN1: begin
                pc_load = 1'b1;
                next_state = CHECK;
            end

            default: next_state = CHECK;
        endcase
    end

endmodule