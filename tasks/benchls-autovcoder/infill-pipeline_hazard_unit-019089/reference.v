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
  always @(*) begin
    if (((rd_Ex == rs1) || (rd_Ex == rs2)) & reg_write_Ex) begin
      if (mem_read_ || beq || bneq || jalr) begin
        pc_mux = 2'b01;  //pc-->pc
        IF_mux = 2'b01;  //hold IF
        control_mux = 1;  //load use hazzard	
      end  //--else: use other forward to compensate, no need stall---//
      else begin
        pc_mux = 2'b00;  //pc+4-->pc        
        IF_mux = 2'b00;  //IF go to next address
        control_mux = 0;
      end
    end else if (jalr) begin
      pc_mux = 2'b11;  //jalr_address-->pc
      IF_mux = 2'b10;  //flush IF
      control_mux = 0;
    end else if (jal) begin
      pc_mux = 2'b10;  //branch or jump address-->pc
      IF_mux = 2'b10;  //flush IF
      control_mux = 0;
    end else if ((beq & equal) || (bneq & (~equal))) begin
      pc_mux = 2'b10;  //branch or jump address-->pc
      IF_mux = 2'b10;  //flush IF
      control_mux = 0;
    end else begin
      pc_mux = 2'b00;  //pc+4-->pc
      IF_mux = 2'b00;  //IF go to next address
      control_mux = 0;
    end
  end
endmodule

