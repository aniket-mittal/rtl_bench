module origen_063092 (
    input wire i_Start, i_Stop, i_Inc, i_RST, i_CLK1KHZ,
    output reg o_ENABLE
);

    // State encoding
    localparam [1:0] 
        RESET = 2'b00,
        START = 2'b01,
        STOP = 2'b10,
        INCREMENT = 2'b11;

    reg [1:0] current_state, next_state;

    // Combinational logic for next state and output
    [MASKED]

    // Sequential logic for state transitions
    always @(posedge i_CLK1KHZ or posedge i_RST) begin
        if (i_RST)
            current_state <= RESET;
        else
            current_state <= next_state;
    end

endmodule