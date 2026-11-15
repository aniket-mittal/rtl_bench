module origen_142505 #(
    parameter n = 4,  // Number of input signals
    parameter m = 3,  // Number of output signals
    parameter s = 5   // Number of states
)(
    input wire clk,
    input wire rst,
    input wire [n-1:0] in,
    output reg [m-1:0] out
);

    // One-hot state encoding
    reg [s-1:0] current_state, next_state;

    // State definitions
    localparam [s-1:0] S0 = 5'b00001,
                       S1 = 5'b00010,
                       S2 = 5'b00100,
                       S3 = 5'b01000,
                       S4 = 5'b10000;

    // State transition logic
    always @(*) begin
        case (current_state)
            S0: next_state = (in[0]) ? S1 : S0;
            S1: next_state = (in[1]) ? S2 : (in[0]) ? S1 : S0;
            S2: next_state = (in[2]) ? S3 : (in[1]) ? S2 : S0;
            S3: next_state = (in[3]) ? S4 : (in[2]) ? S3 : S0;
            S4: next_state = (in[0] & in[3]) ? S0 : S4;
            default: next_state = S0;
        endcase
    end

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Output logic
    always @(*) begin
        case (current_state)
            S0: out = 3'b001;
            S1: out = 3'b010;
            S2: out = 3'b011;
            S3: out = 3'b100;
            S4: out = 3'b101;
            default: out = 3'b000;
        endcase
    end

endmodule