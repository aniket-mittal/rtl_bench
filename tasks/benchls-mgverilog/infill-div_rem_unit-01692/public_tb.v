// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01692 dut (
    .CLK(clk),
    .RST_N(in_vec[68:68]),
    .INST_DIV(in_vec[67:67]),
    .INST_DIVU(in_vec[66:66]),
    .INST_REM(in_vec[65:65]),
    .INST_REMU(in_vec[64:64]),
    .RS1(in_vec[63:32]),
    .RS2(in_vec[31:0]),
    .WAIT(out_vec[33:33]),
    .READY(out_vec[32:32]),
    .RD(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h040c00e7787e7e2d8b;
    stim[1] = 69'h054b2d01e8f1317215;
    stim[2] = 69'h1d25ffc25a6086c035;
    stim[3] = 69'h16df16d88a2a908740;
    stim[4] = 69'h12ccdbb6130fc2f45a;
    stim[5] = 69'h1910a98ee11226d41e;
    stim[6] = 69'h1bc4cf44ba0bd4c15d;
    stim[7] = 69'h16968fcec28e22d2a5;
    stim[8] = 69'h121a4d2d5adcc466a5;
    stim[9] = 69'h17def0bc27dfe545df;
    stim[10] = 69'h1a7c715bee4e802bca;
    stim[11] = 69'h1a3836bb71d984f876;
    stim[12] = 69'h1c8c1061f1cd67a7a4;
    stim[13] = 69'h1814e81d7eb1f9d41e;
    stim[14] = 69'h1f3976356ac33ef195;
    stim[15] = 69'h11bc1175c92649c9d2;
    stim[16] = 69'h17add71a357c69ad37;
    stim[17] = 69'h1c078cd594d74bec3b;
    stim[18] = 69'h1c977ceb59990dcf6a;
    stim[19] = 69'h143cb466ff6222d084;
    stim[20] = 69'h117826fbdf4e5df875;
    stim[21] = 69'h16c02e5acc0c86e6e1;
    stim[22] = 69'h17d4d9dc03645f2df2;
    stim[23] = 69'h1189f66e6ddea439de;
    stim[24] = 69'h18413f0218e9fee584;
    stim[25] = 69'h1c9728ff017ec74823;
    stim[26] = 69'h0b3903431317687209;
    stim[27] = 69'h1d63281f72c50716d4;
    stim[28] = 69'h117ff0c6c9c753d246;
    stim[29] = 69'h1a054b2be07e4e3246;
    stim[30] = 69'h1c52a9988391768a9e;
    stim[31] = 69'h1e681948c3efa2ccb6;
    stim[32] = 69'h1b38cbb6979a74b583;
    stim[33] = 69'h1279ffb92c508d021e;
    stim[34] = 69'h1e43e596e4e9e1767a;
    stim[35] = 69'h13b44ce8f7f5183a88;
    stim[36] = 69'h1eedb038ca75f8084e;
    stim[37] = 69'h1669a516185e0a9304;
    stim[38] = 69'h1a3ca33d20ea8b902c;
    stim[39] = 69'h1c9877fefa848350a4;
    stim[40] = 69'h1239bb0003b0197f5d;
    stim[41] = 69'h15aea7dfae03be7e74;
    stim[42] = 69'h18a2c5f10d3288c729;
    stim[43] = 69'h1581c5048e79b29dde;
    stim[44] = 69'h1425bd2df9831ee9d4;
    stim[45] = 69'h1134e889ec9d570a7b;
    stim[46] = 69'h199652798d6fb8e3ea;
    stim[47] = 69'h126cf4a74bed6b0643;
    stim[48] = 69'h1e4bd1a51efed2460d;
    stim[49] = 69'h1483d2598efb3120e1;
    stim[50] = 69'h1f65329b83a76bdab8;
    stim[51] = 69'h1a460576165e27c98b;
    stim[52] = 69'h1b9c234c302f927192;
    stim[53] = 69'h1e153944f9405d2228;
    stim[54] = 69'h1a103e84dd119d8451;
    stim[55] = 69'h0165ac9b4bc4a0b496;
    stim[56] = 69'h1fad1d85437e8a2b7b;
    stim[57] = 69'h1e67e94be5202fd007;
    stim[58] = 69'h1950be89ad5de14df5;
    stim[59] = 69'h1b3b55e70306469d9b;
    stim[60] = 69'h1024904c140b6e3de0;
    stim[61] = 69'h1c350955f8418be590;
    stim[62] = 69'h183f550f7ae116a491;
    stim[63] = 69'h149286b7cc98b204f4;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h200000000;
      expv[22] = 34'h200000000;
      expv[23] = 34'h200000000;
      expv[24] = 34'h200000000;
      expv[25] = 34'h200000000;
      expv[26] = 34'h200000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h200000000;
      expv[29] = 34'h200000000;
      expv[30] = 34'h200000000;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h200000000;
      expv[35] = 34'h200000000;
      expv[36] = 34'h200000000;
      expv[37] = 34'h200000000;
      expv[38] = 34'h200000000;
      expv[39] = 34'h200000000;
      expv[40] = 34'h200000000;
      expv[41] = 34'h200000000;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h200000000;
      expv[46] = 34'h200000000;
      expv[47] = 34'h200000000;
      expv[48] = 34'h200000000;
      expv[49] = 34'h200000000;
      expv[50] = 34'h200000000;
      expv[51] = 34'h200000000;
      expv[52] = 34'h200000000;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
