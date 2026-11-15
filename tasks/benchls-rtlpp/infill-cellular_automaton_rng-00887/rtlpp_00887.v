module rtlpp_00887(
	input clk,
	input reset,
	input loadseed_i,
	input [31:0] seed_i,
	output reg [31:0] number_o
);

reg [36:0] CASR_reg;
reg [36:0] CASR_varCASR, CASR_outCASR;

[MASKED]

reg [42:0] LFSR_reg;
reg [42:0] LFSR_varLFSR;
reg outbitLFSR;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		LFSR_reg <= 43'b1;
	end else begin
		if (loadseed_i) begin
			LFSR_varLFSR[42:32] <= 11'b0;
			LFSR_varLFSR[31:0] <= seed_i;
			LFSR_reg <= LFSR_varLFSR;
		end else begin
			LFSR_varLFSR = LFSR_reg;

			outbitLFSR = LFSR_varLFSR[42];
			LFSR_varLFSR[42] = LFSR_varLFSR[41];
			LFSR_varLFSR[41] = LFSR_varLFSR[40] ^ outbitLFSR;
			LFSR_varLFSR[40] = LFSR_varLFSR[39];
			LFSR_varLFSR[39] = LFSR_varLFSR[38];
			LFSR_varLFSR[38] = LFSR_varLFSR[37];
			LFSR_varLFSR[37] = LFSR_varLFSR[36];
			LFSR_varLFSR[36] = LFSR_varLFSR[35];
			LFSR_varLFSR[35] = LFSR_varLFSR[34];
			LFSR_varLFSR[34] = LFSR_varLFSR[33];
			LFSR_varLFSR[33] = LFSR_varLFSR[32];
			LFSR_varLFSR[32] = LFSR_varLFSR[31];
			LFSR_varLFSR[31] = LFSR_varLFSR[30];
			LFSR_varLFSR[30] = LFSR_varLFSR[29];
			LFSR_varLFSR[29] = LFSR_varLFSR[28];
			LFSR_varLFSR[28] = LFSR_varLFSR[27];
			LFSR_varLFSR[27] = LFSR_varLFSR[26];
			LFSR_varLFSR[26] = LFSR_varLFSR[25];
			LFSR_varLFSR[25] = LFSR_varLFSR[24];
			LFSR_varLFSR[24] = LFSR_varLFSR[23];
			LFSR_varLFSR[23] = LFSR_varLFSR[22];
			LFSR_varLFSR[22] = LFSR_varLFSR[21];
			LFSR_varLFSR[21] = LFSR_varLFSR[20];
			LFSR_varLFSR[20] = LFSR_varLFSR[19] ^ outbitLFSR;
			LFSR_varLFSR[19] = LFSR_varLFSR[18];
			LFSR_varLFSR[18] = LFSR_varLFSR[17];
			LFSR_varLFSR[17] = LFSR_varLFSR[16];
			LFSR_varLFSR[16] = LFSR_varLFSR[15];
			LFSR_varLFSR[15] = LFSR_varLFSR[14];
			LFSR_varLFSR[14] = LFSR_varLFSR[13];
			LFSR_varLFSR[13] = LFSR_varLFSR[12];
			LFSR_varLFSR[12] = LFSR_varLFSR[11];
			LFSR_varLFSR[11] = LFSR_varLFSR[10];
			LFSR_varLFSR[10] = LFSR_varLFSR[9];
			LFSR_varLFSR[9] = LFSR_varLFSR[8];
			LFSR_varLFSR[8] = LFSR_varLFSR[7];
			LFSR_varLFSR[7] = LFSR_varLFSR[6];
			LFSR_varLFSR[6] = LFSR_varLFSR[5];
			LFSR_varLFSR[5] = LFSR_varLFSR[4];
			LFSR_varLFSR[4] = LFSR_varLFSR[3];
			LFSR_varLFSR[3] = LFSR_varLFSR[2];
			LFSR_varLFSR[2] = LFSR_varLFSR[1];
			LFSR_varLFSR[1] = LFSR_varLFSR[0] ^ outbitLFSR;
			LFSR_varLFSR[0] = LFSR_varLFSR[42];

			LFSR_reg <= LFSR_varLFSR;
		end
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		number_o <= 32'b0;
	end else begin
		number_o <= LFSR_reg[31:0] ^ CASR_reg[31:0];
	end
end

endmodule