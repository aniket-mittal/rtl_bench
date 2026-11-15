// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_208881 dut (
    .A(in_vec[68:37]),
    .B(in_vec[36:5]),
    .Op(in_vec[4:0]),
    .C(out_vec[32:1]),
    .Over(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h1459ed06cf939da358;
    stim[1] = 69'h0ea5376ff4b8dae66c;
    stim[2] = 69'h073b0a169d598219ac;
    stim[3] = 69'h1057a789c215a2f436;
    stim[4] = 69'h04244cd57e3fd0ad54;
    stim[5] = 69'h1554902876647e9b42;
    stim[6] = 69'h0827ec87f5f66d5564;
    stim[7] = 69'h12c2b6d47d748aed1e;
    stim[8] = 69'h05e90298e86e420ebe;
    stim[9] = 69'h1e97c85060d2507037;
    stim[10] = 69'h0b55f1150642306eec;
    stim[11] = 69'h113887cba852465737;
    stim[12] = 69'h0e18dc2a87d808b19f;
    stim[13] = 69'h1e25ce5c5dae8921d1;
    stim[14] = 69'h167b466be8ed9c8667;
    stim[15] = 69'h0506ac2191a650c403;
    stim[16] = 69'h09c181294707b984a0;
    stim[17] = 69'h1c9b4d7e703705ac2a;
    stim[18] = 69'h1274b6111a340554b8;
    stim[19] = 69'h013ee4f6e381dcef5a;
    stim[20] = 69'h1dced9fc6230954272;
    stim[21] = 69'h0d5d93c3fae110f317;
    stim[22] = 69'h006523caa7c1c61ba2;
    stim[23] = 69'h1cbb642615f1d5369c;
    stim[24] = 69'h0d96fea3bbc7b60034;
    stim[25] = 69'h124b6c87473168581c;
    stim[26] = 69'h05272b5cbba09ed223;
    stim[27] = 69'h0d985dcf74cddefbf1;
    stim[28] = 69'h1c8ccca941c216f77e;
    stim[29] = 69'h0f91c1090b669684d2;
    stim[30] = 69'h1897e135da131dd6dd;
    stim[31] = 69'h08a3bf50cb99970bfa;
    stim[32] = 69'h005cb6c3244a5dc9a9;
    stim[33] = 69'h135b5ac7d9f8ebb720;
    stim[34] = 69'h151d71570409553621;
    stim[35] = 69'h0ccd0caf75616f2e9a;
    stim[36] = 69'h0f12426bee32f83314;
    stim[37] = 69'h0bf1003151191158f1;
    stim[38] = 69'h07f4ff324a8b06bf8a;
    stim[39] = 69'h19f0f56c7a18d7fdfc;
    stim[40] = 69'h087ff22cc757892744;
    stim[41] = 69'h135eba0baf9e4cbf78;
    stim[42] = 69'h0f1fa63893d3847b24;
    stim[43] = 69'h1b9903e849c93418ca;
    stim[44] = 69'h1ffd7f13963f3b0e3f;
    stim[45] = 69'h0780cd1da9039a4e2a;
    stim[46] = 69'h0cd394f5d79df3b08b;
    stim[47] = 69'h09ab7bc3ef708391ad;
    stim[48] = 69'h121dd65a17eedf661a;
    stim[49] = 69'h02db5a81da61b4c6d8;
    stim[50] = 69'h12264e296bb14207f0;
    stim[51] = 69'h084274d697178250fb;
    stim[52] = 69'h0e25c4b314dea11cc4;
    stim[53] = 69'h1dc2276c942705ce4f;
    stim[54] = 69'h0c6d24befe8c19903c;
    stim[55] = 69'h0019274c9ae037ba88;
    stim[56] = 69'h04bc42561643593c9b;
    stim[57] = 69'h01492b8469d2150e08;
    stim[58] = 69'h11632f1eb97efbf2ac;
    stim[59] = 69'h17f8f003f3fcfc62c8;
    stim[60] = 69'h166f0528c8a22483ae;
    stim[61] = 69'h0a3e764f5360f2e5c5;
    stim[62] = 69'h142bf9a6049ca8f8be;
    stim[63] = 69'h0f3a0a78f56a53e483;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h1a1ded898;
      expv[2] = 33'h1a62880f2;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h1774febb6;
      expv[6] = 33'h1f643f000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h0d17c17be;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h100000000;
      expv[15] = 33'h10c400000;
      expv[16] = 33'h10c93aade;
      expv[17] = 33'h1013052c2;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h07e5e7dba;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h1ed220000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000022;
      expv[33] = 33'h0d54467ef;
      expv[34] = 33'h11141c20f;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h028006320;
      expv[39] = 33'h000000000;
      expv[40] = 33'h130000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h110000000;
      expv[43] = 33'h098900084;
      expv[44] = 33'h000000000;
      expv[45] = 33'h0100880c2;
      expv[46] = 33'h1fdff7f5c;
      expv[47] = 33'h1004042c0;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h19970c2e8;
      expv[51] = 33'h000000000;
      expv[52] = 33'h09712cc00;
      expv[53] = 33'h000000002;
      expv[54] = 33'h000000000;
      expv[55] = 33'h01ae037ba;
      expv[56] = 33'h000000000;
      expv[57] = 33'h013a42a1c;
      expv[58] = 33'h081dd4ec0;
      expv[59] = 33'h000000002;
      expv[60] = 33'h000000002;
      expv[61] = 33'h000028f9c;
      expv[62] = 33'h000000000;
      expv[63] = 33'h13e480000;
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
