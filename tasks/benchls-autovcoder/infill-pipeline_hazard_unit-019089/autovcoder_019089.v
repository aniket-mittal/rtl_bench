module autovcoder_019089 (
    rs1,
    rs2,
    equal,
    rd_Ex,
    reg_write_Ex,
    jal,
    jalr,
    beq,
    bneq,
    mem_read_,
    pc_mux,
    IF_mux,
    control_mux
);  //variable ending with '_' means next stage value
  input [4:0] rs1, rs2, rd_Ex;
  input equal, jal, jalr, beq, bneq, mem_read_, reg_write_Ex;
  output reg [1:0] pc_mux, IF_mux;
  output reg control_mux;
  [MASKED]
endmodule

