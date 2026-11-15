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

    [MASKED]

endmodule