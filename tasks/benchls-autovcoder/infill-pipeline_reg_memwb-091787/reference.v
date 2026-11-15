module autovcoder_091787 (
    clock,
    reset,
    //from instruction
    des_register,

    //control signals
    writeEnable,
    mux_3_sel,

    //Alu out
    ALUout,

    //data mem outputs
    dmem_out,

    //inst hit signal
    Insthit,

    //outputs
    des_register_out,
    writeEnable_out,
    mux_3_sel_out,
    ALUout_out,
    dmem_out_out,
    Insthit_out
);

  input [31:0] dmem_out, ALUout;
  input [4:0] des_register;
  input reset, clock, writeEnable, mux_3_sel, Insthit;

  output reg [31:0] dmem_out_out, ALUout_out;
  output reg [4:0] des_register_out;
  output reg writeEnable_out, mux_3_sel_out, Insthit_out;

  always @(posedge clock) begin
    #3  //register read delay
    dmem_out_out <= dmem_out;
    ALUout_out       <= ALUout;
    des_register_out <= des_register;
    writeEnable_out  <= writeEnable;
    mux_3_sel_out    <= mux_3_sel;
    Insthit_out      <= Insthit;
  end

  //what should happen when reset????
  always @(posedge clock) begin
    if (reset == 1'b1) begin
      Insthit_out <= 0;
    end
  end

endmodule

