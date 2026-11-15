module origen_222959 #(
    parameter n = 3, // Number of input signals
    parameter m = 2, // Number of output signals
    parameter s1 = 4, // Number of states in original FSM
    parameter s2 = 3 // Number of states in converted FSM
) (
    input clk,
    input reset,
    input [n-1:0] in,
    output [m-1:0] out
);

    // State encoding for original FSM
    localparam [s1-1:0] state_a = 4'b0000,
                        state_b = 4'b0001,
                        state_c = 4'b0010,
                        state_d = 4'b0011;

    // State encoding for converted FSM
    localparam [s2-1:0] state_x = 3'b000,
                        state_y = 3'b001,
                        state_z = 3'b010;

    // State registers
    reg [s1-1:0] current_state_original;
    reg [s2-1:0] current_state_converted;

    // Output register
    reg [m-1:0] out_reg;

    // Next state and output logic
    reg [s1-1:0] next_state_original;
    reg [s2-1:0] next_state_converted;
    reg [m-1:0] next_out;

    // Transition function for original FSM
    always @(*) begin
        case (current_state_original)
            state_a: begin
                if (in == 3'b000)
                    next_state_original = state_a;
                else if (in == 3'b001)
                    next_state_original = state_b;
                else
                    next_state_original = state_d;
            end
            state_b: begin
                if (in == 3'b010)
                    next_state_original = state_c;
                else
                    next_state_original = state_a;
            end
            state_c: begin
                if (in == 3'b011)
                    next_state_original = state_d;
                else
                    next_state_original = state_a;
            end
            state_d: begin
                if (in == 3'b100)
                    next_state_original = state_b;
                else
                    next_state_original = state_c;
            end
        endcase
    end

    // Output logic for original FSM
    always @(*) begin
        case (current_state_original)
            state_a: next_out = 2'b00;
            state_b: next_out = 2'b01;
            state_c: next_out = 2'b10;
            state_d: next_out = 2'b11;
        endcase
    end

    // State encoding conversion function
    always @(*) begin
        case (next_state_original)
            state_a: next_state_converted = state_x;
            state_b: next_state_converted = state_y;
            state_c: next_state_converted = state_z;
            state_d: next_state_converted = state_x;
        endcase
    end

    // State register updates
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state_original <= state_a;
            current_state_converted <= state_x;
        end else begin
            current_state_original <= next_state_original;
            current_state_converted <= next_state_converted;
        end
    end

    // Output register update
    always @(posedge clk or posedge reset) begin
        if (reset)
            out_reg <= 2'b00;
        else
            out_reg <= next_out;
    end

    assign out = out_reg;

endmodule