module rtlpp_00908 (clk, reset, loadseed_i, seed_i, number_o);
    input clk;
    input reset;
    input loadseed_i;
    input [31:0] seed_i;
    output [31:0] number_o;

    reg [31:0] number_o;

    reg [42:0] LFSR_reg;
    reg [36:0] CASR_reg;

    // CASR Logic
    reg [36:0] CASR_varCASR, CASR_outCASR;
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            CASR_reg <= 1;
        end else begin
            if (loadseed_i) begin
                CASR_varCASR[36:32] <= 0;
                CASR_varCASR[31:0] <= seed_i;
                CASR_reg <= CASR_varCASR;
            end else begin
                CASR_varCASR = CASR_reg;

                CASR_outCASR[36] = CASR_varCASR[35] ^ CASR_varCASR[0];
                CASR_outCASR[35] = CASR_varCASR[34] ^ CASR_varCASR[36];
                CASR_outCASR[34] = CASR_varCASR[33] ^ CASR_varCASR[35];
                CASR_outCASR[33] = CASR_varCASR[32] ^ CASR_varCASR[34];
                CASR_outCASR[32] = CASR_varCASR[31] ^ CASR_varCASR[33];
                CASR_outCASR[31] = CASR_varCASR[30] ^ CASR_varCASR[32];
                CASR_outCASR[30] = CASR_varCASR[29] ^ CASR_varCASR[31];
                CASR_outCASR[29] = CASR_varCASR[28] ^ CASR_varCASR[30];
                CASR_outCASR[28] = CASR_varCASR[27] ^ CASR_varCASR[29];
                CASR_outCASR[27] = CASR_varCASR[26] ^ CASR_varCASR[27] ^ CASR_varCASR[28];
                CASR_outCASR[26] = CASR_varCASR[25] ^ CASR_varCASR[27];
                CASR_outCASR[25] = CASR_varCASR[24] ^ CASR_varCASR[26];
                CASR_outCASR[24] = CASR_varCASR[23] ^ CASR_varCASR[25];
                CASR_outCASR[23] = CASR_varCASR[22] ^ CASR_varCASR[24];
                CASR_outCASR[22] = CASR_varCASR[21] ^ CASR_varCASR[23];
                CASR_outCASR[21] = CASR_varCASR[20] ^ CASR_varCASR[22];
                CASR_outCASR[20] = CASR_varCASR[19] ^ CASR_varCASR[21];
                CASR_outCASR[19] = CASR_varCASR[18] ^ CASR_varCASR[20];
                CASR_outCASR[18] = CASR_varCASR[17] ^ CASR_varCASR[19];
                CASR_outCASR[17] = CASR_varCASR[16] ^ CASR_varCASR[18];
                CASR_outCASR[16] = CASR_varCASR[15] ^ CASR_varCASR[17];
                CASR_outCASR[15] = CASR_varCASR[14] ^ CASR_varCASR[16];
                CASR_outCASR[14] = CASR_varCASR[13] ^ CASR_varCASR[15];
                CASR_outCASR[13] = CASR_varCASR[12] ^ CASR_varCASR[14];
                CASR_outCASR[12] = CASR_varCASR[11] ^ CASR_varCASR[13];
                CASR_outCASR[11] = CASR_varCASR[10] ^ CASR_varCASR[12];
                CASR_outCASR[10] = CASR_varCASR[9] ^ CASR_varCASR[11];
                CASR_outCASR[9] = CASR_varCASR[8] ^ CASR_varCASR[10];
                CASR_outCASR[8] = CASR_varCASR[7] ^ CASR_varCASR[9];
                CASR_outCASR[7] = CASR_varCASR[6] ^ CASR_varCASR[8];
                CASR_outCASR[6] = CASR_varCASR[5] ^ CASR_varCASR[7];
                CASR_outCASR[5] = CASR_varCASR[4] ^ CASR_varCASR[6];
                CASR_outCASR[4] = CASR_varCASR[3] ^ CASR_varCASR[5];
                CASR_outCASR[3] = CASR_varCASR[2] ^ CASR_varCASR[4];
                CASR_outCASR[2] = CASR_varCASR[1] ^ CASR_varCASR[3];
                CASR_outCASR[1] = CASR_varCASR[0] ^ CASR_varCASR[2];
                CASR_outCASR[0] = CASR_varCASR[36] ^ CASR_varCASR[1];

                CASR_reg <= CASR_outCASR;
            end
        end
    end

    // LFSR Logic
    reg [42:0] LFSR_varLFSR;
    reg outbitLFSR;
    [MASKED]

    // Output Logic
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            number_o <= 0;
        end else begin
            number_o <= LFSR_reg[31:0] ^ CASR_reg[31:0];
        end
    end

endmodule