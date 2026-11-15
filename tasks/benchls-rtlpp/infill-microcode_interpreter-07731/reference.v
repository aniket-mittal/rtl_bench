module rtlpp_07731
  (input clk,
  input reset,
  input en,
  input [1:0] inReg,
  output reg [6:0] outReg);

  parameter INSTRUCTION_LENGTH = 13;  
  parameter INSTRUCTION_MEM = 1000; 
  parameter PROG_COUNTER_LENGTH = 10;  

  reg [(INSTRUCTION_LENGTH - 1):0] instructions [(INSTRUCTION_MEM - 1):0]; 

  reg [(PROG_COUNTER_LENGTH - 1):0] load_instruction_counter;
  reg [(INSTRUCTION_LENGTH - 1):0] load_bit_counter;

  parameter JUMP_BITS = 7;

  parameter CONST_REG = 1'b1;  
  parameter NUM_INPUT_REGS = 2;
  parameter NUM_OUT_REGS = 7;
  parameter NUM_INTERNAL_REGS = 6;
  parameter REG_ADDR_LENGTH = 4; 

  reg [(PROG_COUNTER_LENGTH - 1):0] prog_counter;
  reg [(NUM_INTERNAL_REGS - 1):0] internal_regs;
  
  wire [(PROG_COUNTER_LENGTH - 1):0] prog_count_return, prog_count_out;
  wire [(REG_ADDR_LENGTH - 1):0] reg_1_addr, reg_2_addr, reg_3_addr, inst_mid, inst_bottom;
  
  wire [(JUMP_BITS - 1):0] operand, jump;
  
  wire ctrl_bit, nand_out, adder_ctrl, bit_6;
  
  reg data_1, data_2;

  assign reg_2_addr = ctrl_bit ? inst_mid : {(REG_ADDR_LENGTH){1'bz}};
  assign reg_3_addr = ctrl_bit ? inst_bottom : {(REG_ADDR_LENGTH){1'bz}};
  assign jump[2:0] = ctrl_bit ? {(3){1'bz}} : inst_mid[3:1];
  assign jump[6:3] = ctrl_bit ? {(4){1'bz}} : inst_bottom;
  assign bit_6 = ctrl_bit ? 1'bz : inst_mid[0];
  
  assign operand[0] = (!ctrl_bit && data_1) ? jump[6] : 1'b1;
  assign operand[1] = (!ctrl_bit && data_1) ? jump[5] : 1'b0;
  assign operand[2] = (!ctrl_bit && data_1) ? jump[4] : 1'b0;
  assign operand[3] = (!ctrl_bit && data_1) ? jump[3] : 1'b0;
  assign operand[4] = (!ctrl_bit && data_1) ? jump[2] : 1'b0;
  assign operand[5] = (!ctrl_bit && data_1) ? jump[1] : 1'b0;
  assign operand[6] = (!ctrl_bit && data_1) ? jump[0] : 1'b0;

  assign adder_ctrl = (!ctrl_bit && bit_6 && data_1);  

  nand (nand_out, data_1, data_2);  

  assign prog_count_return = adder_ctrl ? (prog_count_out - operand) : (prog_count_out + operand);
  assign prog_count_out = prog_counter;

  always @ (posedge clk) begin
    if (reset) begin
      prog_counter = 0;
    end else  begin 
      if (!en) begin
        prog_counter = prog_count_return;
      end
    end
  end

  assign ctrl_bit = instructions[prog_count_out][0]; 
  assign reg_1_addr = instructions[prog_count_out][4:1];
  assign inst_mid = instructions[prog_count_out][8:5];
  assign inst_bottom = instructions[prog_count_out][12:9];

  always @ * begin  
    case (reg_1_addr)
      4'b0000 : data_1 = CONST_REG;  
      4'b1000 : data_1 = inReg[0];
      4'b0100 : data_1 = inReg[1];
      4'b1100 : data_1 = outReg[0];
      4'b0010 : data_1 = outReg[1];
      4'b1010 : data_1 = outReg[2];
      4'b0110 : data_1 = outReg[3];
      4'b1110 : data_1 = outReg[4];
      4'b0001 : data_1 = outReg[5];
      4'b1001 : data_1 = outReg[6];
      4'b0101 : data_1 = internal_regs[0];
      4'b1101 : data_1 = internal_regs[1];
      4'b0011 : data_1 = internal_regs[2];
      4'b1011 : data_1 = internal_regs[3];
      4'b0111 : data_1 = internal_regs[4];
      4'b1111 : data_1 = internal_regs[5];
    endcase

    case (reg_2_addr)
      4'b0000 : data_2 = CONST_REG;  
      4'b1000 : data_2 = inReg[0];
      4'b0100 : data_2 = inReg[1];
      4'b1100 : data_2 = outReg[0];
      4'b0010 : data_2 = outReg[1];
      4'b1010 : data_2 = outReg[2];
      4'b0110 : data_2 = outReg[3];
      4'b1110 : data_2 = outReg[4];
      4'b0001 : data_2 = outReg[5];
      4'b1001 : data_2 = outReg[6];
      4'b0101 : data_2 = internal_regs[0];
      4'b1101 : data_2 = internal_regs[1];
      4'b0011 : data_2 = internal_regs[2];
      4'b1011 : data_2 = internal_regs[3];
      4'b0111 : data_2 = internal_regs[4];
      4'b1111 : data_2 = internal_regs[5];
    endcase
  end

  integer i;
  always @ (posedge clk) begin
    if (reset) begin
      for (i = 0; i < NUM_OUT_REGS; i = i + 1) begin
        outReg[i] = 1'b0;
      end
      for (i = 0; i < NUM_INTERNAL_REGS; i = i + 1) begin
        internal_regs[i] = 1'b0;
      end
    end else begin
      if (ctrl_bit && !en) begin  
        case (reg_3_addr)
          4'b1100 : outReg[0] = nand_out;
          4'b0010 : outReg[1] = nand_out;
          4'b1010 : outReg[2] = nand_out;
          4'b0110 : outReg[3] = nand_out;
          4'b1110 : outReg[4] = nand_out;
          4'b0001 : outReg[5] = nand_out;
          4'b1001 : outReg[6] = nand_out;
          4'b0101 : internal_regs[0] = nand_out;
          4'b1101 : internal_regs[1] = nand_out;
          4'b0011 : internal_regs[2] = nand_out;
          4'b1011 : internal_regs[3] = nand_out;
          4'b0111 : internal_regs[4] = nand_out;
          4'b1111 : internal_regs[5] = nand_out;
        endcase
      end  
    end  
  end  

  always @ (posedge clk) begin
    if (reset) begin
      for (i = 0; i < INSTRUCTION_MEM; i = i + 1) begin
        instructions[i] = 13'b0000000000000;
      end
      load_instruction_counter = 0;
      load_bit_counter = 0;
    end else begin
      if (en) begin
        instructions[load_instruction_counter][load_bit_counter] = inReg[0];
        load_bit_counter = load_bit_counter + 1;
        if (load_bit_counter >= INSTRUCTION_LENGTH) begin
          load_bit_counter = 0;
          load_instruction_counter = load_instruction_counter + 1;
        end
      end
    end 
  end

endmodule