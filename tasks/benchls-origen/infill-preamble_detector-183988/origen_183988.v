module origen_183988 #(
    parameter DETECT_THRESH = 4,
    parameter PREAMBLE_LEN = 8,
    parameter PREAMBLE_VAL = 8'b10101010
) (
    input CLK,
    input RESET,
    input DATA_IN,
    input DATA_IN_VALID,
    output reg DETECT_OUT,
    output reg DETECT_OUT_VALID
);

    reg [PREAMBLE_LEN-1:0] Preamble_Shift_Reg;
    reg [PREAMBLE_LEN-1:0] Preamble_Xor_Reg;
    reg [PREAMBLE_LEN-1:0] Sum_Val_Array [PREAMBLE_LEN-1:0];
    reg [PREAMBLE_LEN-1:0] Sum_Result;

    integer i;

    [MASKED]

endmodule