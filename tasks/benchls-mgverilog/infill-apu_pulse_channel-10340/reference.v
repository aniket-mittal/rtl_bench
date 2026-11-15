module mg_10340(input clk, input ce, input reset, input sq2,input [1:0] Addr,input [7:0] DIN,input MW,input LenCtr_Clock,input Env_Clock,input Enabled,input [7:0] LenCtr_In,output reg [3:0] Sample,output IsNonZero);
reg [7:0] LenCtr; 
 reg [1:0] Duty; 
 reg EnvLoop, EnvDisable, EnvDoReset; 
 reg [3:0] Volume, Envelope, EnvDivider; 
 wire LenCtrHalt = EnvLoop; 
 assign IsNonZero = (LenCtr != 0); 
 reg SweepEnable, SweepNegate, SweepReset; 
 reg [2:0] SweepPeriod, SweepDivider, SweepShift; 
 reg [10:0] Period; 
 reg [11:0] TimerCtr; 
 reg [2:0] SeqPos; 
 wire [10:0] ShiftedPeriod = (Period >> SweepShift); 
 wire [10:0] PeriodRhs = (SweepNegate ? (~ShiftedPeriod + {10'b0, sq2}) : ShiftedPeriod); 
 wire [11:0] NewSweepPeriod = Period + PeriodRhs; 
 wire ValidFreq = Period[10:3] >= 8 && (SweepNegate || !NewSweepPeriod[11]); 
 always @(posedge clk) if (reset) begin 
  LenCtr <= 0; 
  Duty <= 0; 
  EnvDoReset <= 0; 
  EnvLoop <= 0; 
  EnvDisable <= 0; 
  Volume <= 0; 
  Envelope <= 0; 
  EnvDivider <= 0; 
  SweepEnable <= 0; 
  SweepNegate <= 0; 
  SweepReset <= 0; 
  SweepPeriod <= 0; 
  SweepDivider <= 0; 
  SweepShift <= 0; 
  Period <= 0; 
  TimerCtr <= 0; 
  SeqPos <= 0; 
  end else if (ce) begin 
  if (MW) begin 
  case(Addr) 
  0: begin 
  Duty <= DIN[7:6]; 
  EnvLoop <= DIN[5]; 
  EnvDisable <= DIN[4]; 
  Volume <= DIN[3:0]; 
  end 
  1: begin 
  SweepEnable <= DIN[7]; 
  SweepPeriod <= DIN[6:4]; 
  SweepNegate <= DIN[3]; 
  SweepShift <= DIN[2:0]; 
  SweepReset <= 1; 
  end 
  2: begin 
  Period[7:0] <= DIN; 
  end 
  3: begin 
  Period[10:8] <= DIN[2:0]; 
  LenCtr <= LenCtr_In; 
  EnvDoReset <= 1; 
  SeqPos <= 0; 
  end 
  endcase 
  end 
  if (TimerCtr == 0) begin 
  TimerCtr <= {Period, 1'b0}; 
  SeqPos <= SeqPos - 1; 
  end else begin 
  TimerCtr <= TimerCtr - 1; 
  end 
  if (LenCtr_Clock && LenCtr != 0 && !LenCtrHalt) begin 
  LenCtr <= LenCtr - 1; 
  end 
  if (LenCtr_Clock) begin 
  if (SweepDivider == 0) begin 
  SweepDivider <= SweepPeriod; 
  if (SweepEnable && SweepShift != 0 && ValidFreq) 
  Period <= NewSweepPeriod[10:0]; 
  end else begin 
  SweepDivider <= SweepDivider - 1; 
  end 
  if (SweepReset) 
  SweepDivider <= SweepPeriod; 
  SweepReset <= 0; 
  end 
  if (Env_Clock) begin 
  if (EnvDoReset) begin 
  EnvDivider <= Volume; 
  Envelope <= 15; 
  EnvDoReset <= 0; 
  end else if (EnvDivider == 0) begin 
  EnvDivider <= Volume; 
  if (Envelope != 0 || EnvLoop) 
  Envelope <= Envelope - 1; 
  end else begin 
  EnvDivider <= EnvDivider - 1; 
  end 
  end 
  if (!Enabled) 
  LenCtr <= 0; 
 end 
 reg DutyEnabled; 
 always @* begin 
  case (Duty) 
  0: DutyEnabled = (SeqPos == 7); 
  1: DutyEnabled = (SeqPos >= 6); 
  2: DutyEnabled = (SeqPos >= 4); 
  3: DutyEnabled = (SeqPos < 6); 
  endcase 
  if (LenCtr == 0 || !ValidFreq || !DutyEnabled) 
  Sample = 0; 
  else 
  Sample = EnvDisable ? Volume : Envelope; 
 end 
 endmodule