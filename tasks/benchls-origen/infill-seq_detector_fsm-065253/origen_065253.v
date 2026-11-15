module origen_065253 (
    input wire clk,
    input wire rst,
    input wire inp,
    output reg outp
);

    // State encoding
    localparam [1:0] A = 2'b00,
                     B = 2'b01,
                     C = 2'b10,
                     D = 2'b11;

    reg [1:0] state, next_state;

    // State transitions
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= A;
        else
            state <= next_state;
    end

    // Next state and output logic
    [MASKED]

endmodule