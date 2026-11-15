module origen_018051 (
    input wire dout_sr,
    input wire clk,
    input wire rst,
    input wire load_sr,
    output reg [169:0] dout
);

    // State encoding
    localparam [2:0] s0 = 3'b001,
                     s1 = 3'b010,
                     s2 = 3'b100;

    reg [2:0] state, next_state;
    reg [7:0] cnt;
    reg [169:0] dout_tmp;

    // State transition and output logic
    [MASKED]

    // Next state logic
    always @(*) begin
        case (state)
            s0: next_state = load_sr ? s1 : s0;
            s1: next_state = s2;
            s2: next_state = (cnt == 8'd169) ? s0 : s2;
            default: next_state = s0;
        endcase
    end

endmodule