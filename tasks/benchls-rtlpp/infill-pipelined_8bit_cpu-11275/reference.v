module rtlpp_11275(mem_wr_data, mem_wr_addr, mem_wr_en, mem_rd_data1, mem_rd_addr1,
	mem_rd_data2, mem_rd_addr2, reset, clk);
	parameter n=8;
	output reg [n-1:0] mem_wr_data;
	output reg [n-1:0] mem_wr_addr;
	output reg mem_wr_en;
	input [n-1:0] mem_rd_data1;
	output [n-1:0] mem_rd_addr1;
	input [n-1:0] mem_rd_data2;
	output [n-1:0] mem_rd_addr2;
	input reset;
	input clk;

	wire [n-1:0] REG0, REG1, REG2, REG3, OPR0, OPR1;
	wire [2:0] instr;
	// Eliminated illegal continuous assignment to packed arrays
	reg [n-1:0] REG [3:0];
	reg [n-1:0] OPR [1:0];

	parameter [2:0]
		st_if = 3'b000,
		st_id = 3'b001,
		st_ex = 3'b010,
		st_me = 3'b011,
		st_wb = 3'b100;

	reg[2:0] state;

	reg[n-1:0] PC;
	reg[n-1:0] IR;

	assign REG0 = REG[0];
	assign REG1 = REG[1];
	assign REG2 = REG[2];
	assign REG3 = REG[3];
	assign OPR0 = OPR[0];
	assign OPR1 = OPR[1];
	assign instr = IR[7:5];

	assign mem_rd_addr1 = PC;
	// Corrected logic to directly handle addressing
	wire[2:0] op;
	assign op = IR[ir_opcode_hi:ir_opcode_lo];

	parameter ir_opcode_hi = 7;
	parameter ir_opcode_lo = 5;
	parameter ir_reg1_hi = 4;
	parameter ir_reg1_lo = 3;
	parameter ir_reg0_hi = 2;
	parameter ir_reg0_lo = 1;
	parameter ir_dst = 0;

	parameter [2:0]
		add = 3'b000,
		addi = 3'b001,
		sub = 3'b010,
		subi = 3'b011,
		mov = 3'b100,
		movi = 3'b101,
		beq = 3'b110,
		blt = 3'b111;

	assign mem_rd_addr2 = (IR[2:1] == 2'b00) ? REG[IR[ir_reg0_hi:ir_reg0_lo]] : 0;

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			state <= st_if;
			PC <= 8'h00;
		end else begin
			case (state)
				st_if: begin
					IR <= mem_rd_data1;
					PC <= PC + 1;
					state <= st_id;
				end

				st_id: begin
					if (op == add || op == sub || op == beq || op == blt) begin
						OPR[1] <= REG[IR[ir_reg1_hi:ir_reg1_lo]];
						if (IR[ir_reg0_hi:ir_reg0_lo] == 2'b00) begin
							OPR[0] <= mem_rd_data2;
						end else begin
							OPR[0] <= REG[IR[ir_reg0_hi:ir_reg0_lo]];
						end
					end else if (op == addi || op == subi) begin
						OPR[1] <= REG[IR[ir_reg1_hi:ir_reg1_lo]];
						OPR[0] <= IR[ir_reg0_hi:ir_reg0_lo]; // Assuming immediate value is in IR[ir_reg0_hi:ir_reg0_lo]
					end else if (op == mov) begin
						OPR[1] <= (IR[ir_dst]) ? ((IR[ir_reg0_hi:ir_reg0_lo] == 2'b00) ? mem_rd_data2 : REG[IR[ir_reg0_hi:ir_reg0_lo]]) : REG[IR[ir_reg1_hi:ir_reg1_lo]];
					end
					state <= st_ex;
				end

				st_ex: begin
					case (op)
						add:  begin OPR[1] <= OPR[1] + OPR[0]; end
						sub:  begin OPR[1] <= OPR[1] - OPR[0]; end
						addi: begin OPR[1] <= OPR[1] + mem_rd_data1; end
						subi: begin OPR[1] <= OPR[1] - mem_rd_data1; end
						mov:  begin OPR[1] <= OPR[0]; end
						movi: begin OPR[1] <= mem_rd_data1; end
						default: begin end
					endcase

					if (op == addi || op == subi || op == movi) begin
						PC <= PC + 1;
					end else if (op == beq) begin
						if (OPR[1] == OPR[0]) begin
							if (mem_rd_data1[7])
								PC <= PC + 1 - ~(mem_rd_data1 - 1);
							else
								PC <= PC + 1 + mem_rd_data1;
						end else begin
							PC <= PC + 1;
						end
					end else if (op == blt) begin
						if (OPR[1] < OPR[0]) begin
							if (mem_rd_data1[7])
								PC <= PC + 1 - ~(mem_rd_data1 - 1);
							else
								PC <= PC + 1 + mem_rd_data1;
						end else begin
							PC <= PC + 1;
						end
					end
					state <= st_me;
				end

				st_me: begin
					if (IR[2:0] == 3'b000) begin
						mem_wr_addr <= REG[0];
						mem_wr_data <= OPR[1];
						mem_wr_en <= 1'b1;
					end
					state <= st_wb;
				end

				st_wb: begin
					if (IR[2:0] == 3'b000 || IR[7:6] == 2'b11) begin
					end else begin
						if (IR[0] == 1'b0)
							REG[IR[ir_reg0_hi:ir_reg0_lo]] <= OPR[1];
						else
							REG[IR[ir_reg1_hi:ir_reg1_lo]] <= OPR[1];
					end
					mem_wr_en <= 0;
					state <= st_if;
				end

				default: state <= st_if;
			endcase
		end
	end
endmodule