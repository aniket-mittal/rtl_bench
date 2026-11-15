// Hidden tests: 5000 cycles of seeded random inputs (seed 1592424453); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 52;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [7:0] i_9;
  reg [7:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_146848 dut (
    .clk(clk),
    .rst_n(i_0),
    .InjectorArmFinishMovement_eI(i_1),
    .EmergencyStopChanged_eI(i_2),
    .CanisterPressureChanged_eI(i_3),
    .FillContentsAvailableChanged_eI(i_4),
    .LasersChanged_eI(i_5),
    .DoorOverride_eI(i_6),
    .VacuumTimerElapsed_eI(i_7),
    .EmergencyStop_I(i_8),
    .CanisterPressure_I(i_9),
    .FillContentsAvailable_I(i_10),
    .DoorSiteLaser_I(i_11),
    .InjectSiteLaser_I(i_12),
    .RejectSiteLaser_I(i_13),
    .RejectBinLaser_I(i_14),
    .AcceptBinLaser_I(i_15),
    .DoorReleaseCanister_eO(out_dut[51:51]),
    .ConveyorChanged_eO(out_dut[50:50]),
    .InjectorPositionChanged_eO(out_dut[49:49]),
    .InjectorControlsChanged_eO(out_dut[48:48]),
    .FillContentsChanged_eO(out_dut[47:47]),
    .StartVacuumTimer_eO(out_dut[46:46]),
    .GoRejectArm_eO(out_dut[45:45]),
    .CanisterCountChanged_eO(out_dut[44:44]),
    .InjectDone_eO(out_dut[43:43]),
    .ConveyorSpeed_O(out_dut[42:35]),
    .InjectorPosition_O(out_dut[34:27]),
    .InjectorContentsValveOpen_O(out_dut[26:26]),
    .InjectorVacuumRun_O(out_dut[25:25]),
    .InjectorPressurePumpRun_O(out_dut[24:24]),
    .FillContents_O(out_dut[23:16]),
    .CanisterCount_O(out_dut[15:0])
  );
  origen_146848__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .InjectorArmFinishMovement_eI(i_1),
    .EmergencyStopChanged_eI(i_2),
    .CanisterPressureChanged_eI(i_3),
    .FillContentsAvailableChanged_eI(i_4),
    .LasersChanged_eI(i_5),
    .DoorOverride_eI(i_6),
    .VacuumTimerElapsed_eI(i_7),
    .EmergencyStop_I(i_8),
    .CanisterPressure_I(i_9),
    .FillContentsAvailable_I(i_10),
    .DoorSiteLaser_I(i_11),
    .InjectSiteLaser_I(i_12),
    .RejectSiteLaser_I(i_13),
    .RejectBinLaser_I(i_14),
    .AcceptBinLaser_I(i_15),
    .DoorReleaseCanister_eO(out_ref[51:51]),
    .ConveyorChanged_eO(out_ref[50:50]),
    .InjectorPositionChanged_eO(out_ref[49:49]),
    .InjectorControlsChanged_eO(out_ref[48:48]),
    .FillContentsChanged_eO(out_ref[47:47]),
    .StartVacuumTimer_eO(out_ref[46:46]),
    .GoRejectArm_eO(out_ref[45:45]),
    .CanisterCountChanged_eO(out_ref[44:44]),
    .InjectDone_eO(out_ref[43:43]),
    .ConveyorSpeed_O(out_ref[42:35]),
    .InjectorPosition_O(out_ref[34:27]),
    .InjectorContentsValveOpen_O(out_ref[26:26]),
    .InjectorVacuumRun_O(out_ref[25:25]),
    .InjectorPressurePumpRun_O(out_ref[24:24]),
    .FillContents_O(out_ref[23:16]),
    .CanisterCount_O(out_ref[15:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 1592424453;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
