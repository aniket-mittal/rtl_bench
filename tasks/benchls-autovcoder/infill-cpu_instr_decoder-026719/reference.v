module autovcoder_026719( // @suppress "Design unit name 'decoder_control' does not match file name 'hw8v2'"
    input [31:0] instr,
    input [3:0] flag,
    output reg jmp_en,
    output reg jmp_reg_en,
    output reg flag_en,
    output reg data_w_en,
    output reg data_mem,
    output reg data_mem_en,
    output reg [1:0] op,
    output reg [3:0] cmd,
    output reg [3:0] src_addr,
    output reg [3:0] dest_reg,
    output reg [11:0] imm_instr_mem,
    output reg [23:0] imm_instr
);

  always @(*) begin
    op  <= instr[27:26];  //op is 26-27 in all cases
    cmd <= instr[24:21];  //cond is 28-31 in all cases

    case (op)
      2'b00: //data processing
			begin
        data_mem   <= 0;
        data_mem_en  <= 0;
        data_w_en   <= cmd == 10? 0:1;
        dest_reg   <= instr[15:12];
        flag_en   <= instr[20] == 1? 1:0;
        imm_instr   <= 0;
        imm_instr_mem  <= 0;
        jmp_en    <= 0;
        jmp_reg_en   <= 0;
        src_addr   <= instr[19:16];
      end

      2'b01: //memory
			begin
        data_mem_en  <= 1;
        data_w_en   <= 0;
        dest_reg   <= instr[15:12];
        flag_en   <= 0;
        imm_instr   <= 0;
        jmp_en    <= 0;
        jmp_reg_en   <= 0;
        src_addr   <= instr[19:16];

        if (instr[20] == 1) begin
          data_mem <= 1;
          data_mem_en <= 1;
        end else begin
          data_mem <= 0;
          data_mem_en <= 0;
        end

        imm_instr_mem <= instr[25] == 1 ? instr[11:0] : 0;
      end



      2'b10: //branching
			begin
        data_mem   <= 0;
        data_mem   <= 0;
        data_mem_en  <= 0;
        data_w_en   <= 0;
        dest_reg   <= 0;
        flag_en   <= 0;
        imm_instr   <= instr[23:0];
        imm_instr_mem  <= 0;
        jmp_en    <= 1;
        jmp_reg_en   <= 1;
        src_addr   <= 0;
      end

      default: //if non of the above mentioned opcodes are in the data
			begin
        data_mem   <= 0;
        data_mem   <= 0;
        data_mem_en  <= 0;
        data_w_en   <= 0;
        dest_reg   <= 0;
        flag_en   <= 0;
        imm_instr   <= 0;
        imm_instr_mem  <= 0;
        jmp_en    <= 0;
        jmp_reg_en   <= 0;
        src_addr   <= 0;
      end
    endcase
  end
endmodule

