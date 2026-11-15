module autovcoder_091785 (
    clock,
    reset,
    busywait,
    //from instruction
    des_register,
    Funct3,
    rs1,
    rs2,  /*  Hazard handling update: Rs1 and rs2 from instruction is needed in the alu stage*/

    //control signals
    mux_5_sel,
    writeEnable,
    mux_3_sel,
    memWrite,
    memRead,
    ALUop,
    mux_4_sel,
    branch,
    jump,
    mux_1_sel,

    //PC
    PC,
    nextPC,

    //regfile outputs
    data1,
    data2,

    //immidiate value
    mux_2_out,

    //inst hit signal
    Insthit,

    //branch address
    B_address,

    //outputs
    des_register_out,
    Funct3_out,
    rs1_out,
    rs2_out,
    mux_5_sel_out,
    writeEnable_out,
    mux_3_sel_out,
    memWrite_out,
    memRead_out,
    ALUop_out,
    mux_4_sel_out,
    branch_out,
    jump_out,
    mux_1_sel_out,
    PC_out,
    nextPC_out,
    data1_out,
    data2_out,
    mux_2_out_out,
    Insthit_out,
    B_address_out
);

  input [31:0] nextPC, PC, data1, data2, mux_2_out, B_address;
  input [4:0] ALUop, des_register, rs1, rs2;
  input [2:0] Funct3;
  input [1:0] mux_4_sel;
  input        reset,clock,busywait,mux_5_sel,writeEnable,mux_3_sel,memWrite,memRead,branch,jump,mux_1_sel,Insthit;

  output reg [31:0] nextPC_out, PC_out, data1_out, data2_out, mux_2_out_out, B_address_out;
  output reg [4:0] ALUop_out, des_register_out, rs1_out, rs2_out;
  output reg [2:0] Funct3_out;
  output reg [1:0] mux_4_sel_out;
  output reg        mux_5_sel_out,writeEnable_out,mux_3_sel_out,memWrite_out,memRead_out,branch_out,jump_out,mux_1_sel_out,Insthit_out;

  always @(posedge clock) begin
    #3  //register read delay
    if (!busywait) begin
      nextPC_out       <= nextPC;
      PC_out           <= PC;
      data1_out        <= data1;
      data2_out        <= data2;
      ALUop_out        <= ALUop;
      des_register_out <= des_register;
      mux_2_out_out    <= mux_2_out;
      Funct3_out       <= Funct3;
      mux_4_sel_out    <= mux_4_sel;
      mux_5_sel_out    <= mux_5_sel;
      writeEnable_out  <= writeEnable;
      mux_3_sel_out    <= mux_3_sel;
      memWrite_out     <= memWrite;
      memRead_out      <= memRead;
      branch_out       <= branch;
      jump_out         <= jump;
      mux_1_sel_out    <= mux_1_sel;
      Insthit_out      <= Insthit;
      rs1_out          <= rs1;
      rs2_out          <= rs2;
      B_address_out    <= B_address;
    end
  end

  //waht should happen when reset????
  always @(posedge clock) begin
    if (reset == 1'b1) begin
      Insthit_out <= 0;
    end
  end

endmodule

