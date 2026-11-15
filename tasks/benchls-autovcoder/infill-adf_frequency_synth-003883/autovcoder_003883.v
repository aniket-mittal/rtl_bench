module autovcoder_003883 (
    input RST,
    input CLK,
    input CFG_EN,     //Config enable
    input LO_SET,     //LO_SET is high 
    input  [23:0]FREQ, //target frequency  unit = KHz
    output [31:0]ADF_R0,
    output [31:0]ADF_R4,
    output  DONE
);

  reg [23:0] FreqReg, FreqRegNext;
  //calculate R0 and R4
  reg [31:0] FreqintReg, FreqintReg_next;
  reg [31:0] FreqfracReg, FreqfracReg_next;
  reg [31:0] LO_FreqintReg, LO_FreqintReg_next;
  reg [31:0] LO_FreqfracReg, LO_FreqfracReg_next;

  reg [2:0] FreqCalStatus, FreqCalStatus_next;
  localparam [2:0]
CAL_STATUS_IDLE = 3'd0,
CAL_STATUS_R0_STEP_0 = 3'd1,
CAL_STATUS_R0_STEP_1 = 3'd2,
CAL_STATUS_R0_STEP_2 = 3'd3;

  reg [31:0] ADF_R0_reg, ADF_R0_regNext;
  reg [31:0] ADF_R4_reg, ADF_R4_regNext;
  reg Done_reg, Done_regNext;
  always @(negedge RST, posedge CLK) begin

    if (!RST) begin
      ADF_R0_reg <= 32'H00501f40;
      ADF_R4_reg <= 32'h00AC803C;
      FreqCalStatus <= CAL_STATUS_IDLE;
    end else begin
      ADF_R0_reg <= ADF_R0_regNext;
      ADF_R4_reg <= ADF_R4_regNext;
      FreqCalStatus <= FreqCalStatus_next;

      FreqReg <= FreqRegNext;
    end

  end
  assign ADF_R0 = ADF_R0_reg;
  assign ADF_R4 = ADF_R4_reg;
  assign DONE   = Done_reg;

  [MASKED]

endmodule

