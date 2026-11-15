// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146848 dut (
    .clk(clk),
    .rst_n(in_vec[29:29]),
    .InjectorArmFinishMovement_eI(in_vec[28:28]),
    .EmergencyStopChanged_eI(in_vec[27:27]),
    .CanisterPressureChanged_eI(in_vec[26:26]),
    .FillContentsAvailableChanged_eI(in_vec[25:25]),
    .LasersChanged_eI(in_vec[24:24]),
    .DoorOverride_eI(in_vec[23:23]),
    .VacuumTimerElapsed_eI(in_vec[22:22]),
    .EmergencyStop_I(in_vec[21:21]),
    .CanisterPressure_I(in_vec[20:13]),
    .FillContentsAvailable_I(in_vec[12:5]),
    .DoorSiteLaser_I(in_vec[4:4]),
    .InjectSiteLaser_I(in_vec[3:3]),
    .RejectSiteLaser_I(in_vec[2:2]),
    .RejectBinLaser_I(in_vec[1:1]),
    .AcceptBinLaser_I(in_vec[0:0]),
    .DoorReleaseCanister_eO(out_vec[51:51]),
    .ConveyorChanged_eO(out_vec[50:50]),
    .InjectorPositionChanged_eO(out_vec[49:49]),
    .InjectorControlsChanged_eO(out_vec[48:48]),
    .FillContentsChanged_eO(out_vec[47:47]),
    .StartVacuumTimer_eO(out_vec[46:46]),
    .GoRejectArm_eO(out_vec[45:45]),
    .CanisterCountChanged_eO(out_vec[44:44]),
    .InjectDone_eO(out_vec[43:43]),
    .ConveyorSpeed_O(out_vec[42:35]),
    .InjectorPosition_O(out_vec[34:27]),
    .InjectorContentsValveOpen_O(out_vec[26:26]),
    .InjectorVacuumRun_O(out_vec[25:25]),
    .InjectorPressurePumpRun_O(out_vec[24:24]),
    .FillContents_O(out_vec[23:16]),
    .CanisterCount_O(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h17f1c05f;
    stim[1] = 30'h1c978549;
    stim[2] = 30'h35fa5ef9;
    stim[3] = 30'h38696340;
    stim[4] = 30'h2069ce5a;
    stim[5] = 30'h36f1a520;
    stim[6] = 30'h3bd0ee16;
    stim[7] = 30'h1551e669;
    stim[8] = 30'h26a8cd00;
    stim[9] = 30'h269c005b;
    stim[10] = 30'h2f2e8c5a;
    stim[11] = 30'h3c4ca1f6;
    stim[12] = 30'h2d9011b7;
    stim[13] = 30'h34e76948;
    stim[14] = 30'h3895de99;
    stim[15] = 30'h3514cd73;
    stim[16] = 30'h285cbae7;
    stim[17] = 30'h2c986473;
    stim[18] = 30'h2a940695;
    stim[19] = 30'h209b8719;
    stim[20] = 30'h38f29b45;
    stim[21] = 30'h3bb7aecc;
    stim[22] = 30'h231c236e;
    stim[23] = 30'h01111b51;
    stim[24] = 30'h22247914;
    stim[25] = 30'h357c8b1c;
    stim[26] = 30'h2da3ed35;
    stim[27] = 30'h2b73eef9;
    stim[28] = 30'h209ab3a5;
    stim[29] = 30'h3d882a74;
    stim[30] = 30'h2034a2a8;
    stim[31] = 30'h23fd375c;
    stim[32] = 30'h2bb89a9f;
    stim[33] = 30'h29172b15;
    stim[34] = 30'h201743a0;
    stim[35] = 30'h299c690b;
    stim[36] = 30'h1e0784cf;
    stim[37] = 30'h3e63f2e4;
    stim[38] = 30'h3dc5fd95;
    stim[39] = 30'h251e102f;
    stim[40] = 30'h3dc2ea08;
    stim[41] = 30'h3bbb30b0;
    stim[42] = 30'h2389019c;
    stim[43] = 30'h2b600ac9;
    stim[44] = 30'h28283605;
    stim[45] = 30'h323b35a2;
    stim[46] = 30'h27015e0b;
    stim[47] = 30'h369e55c6;
    stim[48] = 30'h37f61f94;
    stim[49] = 30'h399d51a7;
    stim[50] = 30'h245e6e1b;
    stim[51] = 30'h393c7b84;
    stim[52] = 30'h31a36596;
    stim[53] = 30'h355f384e;
    stim[54] = 30'h3c6fccea;
    stim[55] = 30'h2f63c350;
    stim[56] = 30'h3069d4c8;
    stim[57] = 30'h20fed966;
    stim[58] = 30'h3c1dca0f;
    stim[59] = 30'h268a1273;
    stim[60] = 30'h35950c2c;
    stim[61] = 30'h247b0a9c;
    stim[62] = 30'h33dd9822;
    stim[63] = 30'h3a192862;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 52'h0000000000000;
      expv[1] = 52'h0000000000000;
      expv[2] = 52'h0000000000000;
      expv[3] = 52'hd000000000000;
      expv[4] = 52'hd000000000000;
      expv[5] = 52'hd000000000000;
      expv[6] = 52'hd000000000000;
      expv[7] = 52'h0000000000000;
      expv[8] = 52'h0000000000000;
      expv[9] = 52'hd000000000000;
      expv[10] = 52'hf0007f8000000;
      expv[11] = 52'hf0007f8000000;
      expv[12] = 52'hf0327f8000000;
      expv[13] = 52'hf0327f8000000;
      expv[14] = 52'hf0007f8000000;
      expv[15] = 52'hf0007f8000000;
      expv[16] = 52'hf4007fa000000;
      expv[17] = 52'hfc007fcd70000;
      expv[18] = 52'hff007fcd70001;
      expv[19] = 52'hff007fcd70002;
      expv[20] = 52'hff007fcd70003;
      expv[21] = 52'hff007f8d70003;
      expv[22] = 52'hff007f8d70003;
      expv[23] = 52'h0000000000000;
      expv[24] = 52'h0000000000000;
      expv[25] = 52'hd000000000000;
      expv[26] = 52'hd000000000000;
      expv[27] = 52'hd000000000000;
      expv[28] = 52'hd000000000000;
      expv[29] = 52'hd032000000000;
      expv[30] = 52'hd032000000000;
      expv[31] = 52'hd000000000000;
      expv[32] = 52'hd000000000000;
      expv[33] = 52'hd000000000000;
      expv[34] = 52'hd032000000000;
      expv[35] = 52'hd032000000000;
      expv[36] = 52'h0000000000000;
      expv[37] = 52'h0000000000000;
      expv[38] = 52'hd000000000000;
      expv[39] = 52'hd032000000000;
      expv[40] = 52'hf0327f8000000;
      expv[41] = 52'hf4327fa000000;
      expv[42] = 52'hf4007f8000000;
      expv[43] = 52'hf4007f8000000;
      expv[44] = 52'hf4007f8000000;
      expv[45] = 52'hf4007f8000000;
      expv[46] = 52'hf4007f8000000;
      expv[47] = 52'hf4007f8000000;
      expv[48] = 52'hf4007fa000000;
      expv[49] = 52'hf4007f8000000;
      expv[50] = 52'hf4327f8000000;
      expv[51] = 52'hf4327f8000000;
      expv[52] = 52'hf4007f8000000;
      expv[53] = 52'hf4007f8000000;
      expv[54] = 52'hf4007f8000000;
      expv[55] = 52'hf4007f8000000;
      expv[56] = 52'hf4007f8000000;
      expv[57] = 52'hf4007f8000000;
      expv[58] = 52'hf4007f8000000;
      expv[59] = 52'hf4007f8000000;
      expv[60] = 52'hf4007f8000000;
      expv[61] = 52'hf4007fa000000;
      expv[62] = 52'hf4007f8000000;
      expv[63] = 52'hf4327f8000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
