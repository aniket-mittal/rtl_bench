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

    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            Preamble_Shift_Reg <= 0;
            Preamble_Xor_Reg <= 0;
            Sum_Result <= 0;
            DETECT_OUT <= 0;
            DETECT_OUT_VALID <= 0;
        end
        else begin
            if (DATA_IN_VALID) begin
                Preamble_Shift_Reg <= {Preamble_Shift_Reg[PREAMBLE_LEN-2:0], DATA_IN};
                Preamble_Xor_Reg <= Preamble_Shift_Reg ^ PREAMBLE_VAL;

                Sum_Val_Array[0] <= Preamble_Xor_Reg;
                for (i = 1; i < PREAMBLE_LEN; i = i + 1) begin
                    Sum_Val_Array[i] <= Sum_Val_Array[i-1] >> 1;
                end

                Sum_Result <= 0;
                for (i = 0; i < PREAMBLE_LEN; i = i + 1) begin
                    Sum_Result <= Sum_Result + Sum_Val_Array[i];
                end

                if (Sum_Result > DETECT_THRESH) begin
                    DETECT_OUT <= 1;
                end
                else begin
                    DETECT_OUT <= 0;
                end

                DETECT_OUT_VALID <= ~DETECT_OUT_VALID;
            end
        end
    end

endmodule