module origen_140174 #(
    parameter n = 4,  // Number of input signals
    parameter m = 3,  // Number of output signals
    parameter s = 5,  // Number of states
    parameter t = 8   // Number of transitions
) (
    input wire [n-1:0] in,
    input wire clk,
    input wire rst,
    output reg [m-1:0] out
);

    // State encoding
    localparam [2:0] S0 = 3'b000,
                     S1 = 3'b001,
                     S2 = 3'b010,
                     S3 = 3'b011,
                     S4 = 3'b100;

    reg [2:0] current_state, next_state;

    // State transition logic
    always @(*) begin
        case (current_state)
            S0: next_state = (in[0] & in[1]) ? S1 : (in[2] & in[3]) ? S2 : S0;
            S1: next_state = in[1] ? S3 : (in[0] & in[2]) ? S4 : S1;
            S2: next_state = in[3] ? S4 : (in[0] | in[1]) ? S0 : S2;
            S3: next_state = (in[0] & in[3]) ? S2 : (in[1] & in[2]) ? S4 : S3;
            S4: next_state = in[2] ? S0 : (in[0] & in[1] & in[3]) ? S1 : S4;
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
            S0: out = {in[0], in[1], 1'b0};
            S1: out = {in[1], in[2], 1'b1};
            S2: out = {in[2], in[3], 1'b0};
            S3: out = {in[0], in[3], 1'b1};
            S4: out = {in[1], in[2], in[3]};
            default: out = {m{1'b0}};
        endcase
    end

endmodule