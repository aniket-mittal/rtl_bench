module origen_169545(
    input           LR_CK,
    input           BIT_CK,
    input           DIN,
    input           RESET,
    output [15:0]   DATA_L,
    output [15:0]   DATA_R,
    output          STROBE,
    output          STROBE_LR
);

    reg [15:0] shift_reg;
    reg [3:0]  counter;
    reg [15:0] DATA_L_reg;
    reg [15:0] DATA_R_reg;
    reg        STROBE_LR_reg;
    reg        output_strobed;

    [MASKED]

    assign DATA_L = DATA_L_reg;
    assign DATA_R = DATA_R_reg;
    assign STROBE = (counter == 0) && !output_strobed;
    assign STROBE_LR = STROBE_LR_reg;

    always @(posedge STROBE) begin
        output_strobed <= 1'b1;
    end

endmodule