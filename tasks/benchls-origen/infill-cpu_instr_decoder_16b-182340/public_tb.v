// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182340 dut (
    .ins(in_vec[16:1]),
    .is_ban(in_vec[0:0]),
    .stop(out_vec[32:32]),
    .change_pc(out_vec[31:20]),
    .type_pc(out_vec[19:18]),
    .acc_we(out_vec[17:17]),
    .ram_add(out_vec[16:5]),
    .ram_we(out_vec[4:4]),
    .op(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h07254;
    stim[1] = 17'h02207;
    stim[2] = 17'h02b55;
    stim[3] = 17'h0248e;
    stim[4] = 17'h107b2;
    stim[5] = 17'h07ae1;
    stim[6] = 17'h1903c;
    stim[7] = 17'h15e42;
    stim[8] = 17'h17a9a;
    stim[9] = 17'h073aa;
    stim[10] = 17'h1a5f4;
    stim[11] = 17'h1d239;
    stim[12] = 17'h0e350;
    stim[13] = 17'h1342c;
    stim[14] = 17'h1cc59;
    stim[15] = 17'h06026;
    stim[16] = 17'h19742;
    stim[17] = 17'h1ac35;
    stim[18] = 17'h19ed9;
    stim[19] = 17'h0cf8e;
    stim[20] = 17'h1a6d8;
    stim[21] = 17'h1cbdf;
    stim[22] = 17'h10892;
    stim[23] = 17'h1eeee;
    stim[24] = 17'h11cd1;
    stim[25] = 17'h12065;
    stim[26] = 17'h0e6dd;
    stim[27] = 17'h1120c;
    stim[28] = 17'h11c51;
    stim[29] = 17'h1b0e2;
    stim[30] = 17'h11553;
    stim[31] = 17'h191b9;
    stim[32] = 17'h1539e;
    stim[33] = 17'h1ead8;
    stim[34] = 17'h1fe26;
    stim[35] = 17'h0a363;
    stim[36] = 17'h1ae48;
    stim[37] = 17'h0afcb;
    stim[38] = 17'h18ec9;
    stim[39] = 17'h0f37b;
    stim[40] = 17'h098e4;
    stim[41] = 17'h0d446;
    stim[42] = 17'h10843;
    stim[43] = 17'h0551b;
    stim[44] = 17'h1f08a;
    stim[45] = 17'h00ace;
    stim[46] = 17'h070e6;
    stim[47] = 17'h0fddc;
    stim[48] = 17'h056f9;
    stim[49] = 17'h06fc4;
    stim[50] = 17'h1a46b;
    stim[51] = 17'h1f577;
    stim[52] = 17'h06222;
    stim[53] = 17'h09d56;
    stim[54] = 17'h1484d;
    stim[55] = 17'h0dbdc;
    stim[56] = 17'h18361;
    stim[57] = 17'h1ac7b;
    stim[58] = 17'h1dc12;
    stim[59] = 17'h1b9a4;
    stim[60] = 17'h173a6;
    stim[61] = 17'h1940b;
    stim[62] = 17'h08c60;
    stim[63] = 17'h1b902;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h000020005;
      expv[1] = 33'h000020007;
      expv[2] = 33'h000020007;
      expv[3] = 33'h000020007;
      expv[4] = 33'h03d94000f;
      expv[5] = 33'h03d920005;
      expv[6] = 33'h03d92000f;
      expv[7] = 33'h03d92000f;
      expv[8] = 33'h03d92000f;
      expv[9] = 33'h03d920005;
      expv[10] = 33'h03d92000f;
      expv[11] = 33'h03d92000f;
      expv[12] = 33'h03d923509;
      expv[13] = 33'h0a160350f;
      expv[14] = 33'h0a160350f;
      expv[15] = 33'h0a1623505;
      expv[16] = 33'h0a162350f;
      expv[17] = 33'h0a162350f;
      expv[18] = 33'h0a162350f;
      expv[19] = 33'h0a160f8f8;
      expv[20] = 33'h0a160f8ff;
      expv[21] = 33'h0a160f8ff;
      expv[22] = 33'h04494f8ef;
      expv[23] = 33'h04494f8ef;
      expv[24] = 33'h0e684f8ef;
      expv[25] = 33'h00328f8ef;
      expv[26] = 33'h003226dc9;
      expv[27] = 33'h090646dcf;
      expv[28] = 33'h0e2846dcf;
      expv[29] = 33'h0e2846dcf;
      expv[30] = 33'h0aa946dcf;
      expv[31] = 33'h0aa946dcf;
      expv[32] = 33'h0aa946dcf;
      expv[33] = 33'h0aa946dcf;
      expv[34] = 33'h0aa946dcf;
      expv[35] = 33'h0aa923620;
      expv[36] = 33'h0aa92362f;
      expv[37] = 33'h0aa92fca0;
      expv[38] = 33'h0aa92fcaf;
      expv[39] = 33'h0aa9337a9;
      expv[40] = 33'h1aa9337af;
      expv[41] = 33'h1aa914478;
      expv[42] = 33'h14215446f;
      expv[43] = 33'h142134464;
      expv[44] = 33'h14213446f;
      expv[45] = 33'h142134466;
      expv[46] = 33'h142134465;
      expv[47] = 33'h14213ddc9;
      expv[48] = 33'h14213ddc4;
      expv[49] = 33'h14213ddc5;
      expv[50] = 33'h14213ddcf;
      expv[51] = 33'h14213ddcf;
      expv[52] = 33'h14213ddc5;
      expv[53] = 33'h14213ddcf;
      expv[54] = 33'h14213ddcf;
      expv[55] = 33'h14211bdd8;
      expv[56] = 33'h14211bddf;
      expv[57] = 33'h14211bddf;
      expv[58] = 33'h14211bddf;
      expv[59] = 33'h14211bddf;
      expv[60] = 33'h14211bddf;
      expv[61] = 33'h14211bddf;
      expv[62] = 33'h14211bddf;
      expv[63] = 33'h14211bddf;
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
