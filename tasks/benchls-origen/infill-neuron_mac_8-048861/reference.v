module origen_048861(
    input signed [8:0] A1, A2, A3, A4, A5, A6, A7, A8,
    input signed [1:0] W1, W2, W3, W4, W5, W6, W7, W8,
    input clk,
    output reg signed [11:0] out_neuron
);

    reg signed [8:0] Activation [0:7];
    reg signed [1:0] Weight [0:7];
    reg signed [10:0] out_array [0:7];
    reg signed [11:0] y;
    reg [1:0] Pres_state, Next_state;
    reg reset;
    integer i;

    localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk) begin
        Pres_state <= Next_state;
    end

    always @(*) begin
        case(Pres_state)
            S0: begin
                reset = 0;
                Activation[0] = A1; Activation[1] = A2; Activation[2] = A3; Activation[3] = A4;
                Activation[4] = A5; Activation[5] = A6; Activation[6] = A7; Activation[7] = A8;
                Weight[0] = W1; Weight[1] = W2; Weight[2] = W3; Weight[3] = W4;
                Weight[4] = W5; Weight[5] = W6; Weight[6] = W7; Weight[7] = W8;
                Next_state = S1;
            end
            S1: begin
                for(i = 0; i < 8; i = i + 1) begin
                    out_array[i] = Activation[i] * Weight[i];
                end
                Next_state = S2;
            end
            S2: begin
                y = 0;
                for(i = 0; i < 8; i = i + 1) begin
                    y = y + out_array[i];
                end
                Next_state = S3;
            end
            S3: begin
                out_neuron = y;
                Next_state = S0;
            end
            default: Next_state = S0;
        endcase
    end

endmodule