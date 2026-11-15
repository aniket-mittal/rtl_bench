module origen_028702 (
    input wire clk,
    input wire async_nreset,
    input wire next_segment_re,
    output reg [7:0] display
);

    // State definitions
    localparam [2:0] STATE_A = 3'b000,
                     STATE_B = 3'b001,
                     STATE_C = 3'b010,
                     STATE_D = 3'b011,
                     STATE_E = 3'b100,
                     STATE_F = 3'b101;

    // State registers
    reg [2:0] state_reg, state_next;

    // Next state logic
    always @(*) begin
        case (state_reg)
            STATE_A: state_next = next_segment_re ? STATE_B : STATE_A;
            STATE_B: state_next = next_segment_re ? STATE_C : STATE_B;
            STATE_C: state_next = next_segment_re ? STATE_D : STATE_C;
            STATE_D: state_next = next_segment_re ? STATE_E : STATE_D;
            STATE_E: state_next = next_segment_re ? STATE_F : STATE_E;
            STATE_F: state_next = next_segment_re ? STATE_A : STATE_F;
            default: state_next = STATE_A;
        endcase
    end

    // State update
    always @(posedge clk or negedge async_nreset) begin
        if (!async_nreset)
            state_reg <= STATE_A;
        else
            state_reg <= state_next;
    end

    // Output logic
    always @(*) begin
        case (state_reg)
            STATE_A: display = 8'b00000001;
            STATE_B: display = 8'b00000010;
            STATE_C: display = 8'b00000100;
            STATE_D: display = 8'b00001000;
            STATE_E: display = 8'b00010000;
            STATE_F: display = 8'b00100000;
            default: display = 8'b00000000;
        endcase
    end

endmodule