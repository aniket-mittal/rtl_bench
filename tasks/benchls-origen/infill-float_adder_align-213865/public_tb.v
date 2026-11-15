// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_213865 dut (
    .clk(clk),
    .rst(in_vec[76:76]),
    .x1(in_vec[75:43]),
    .y1(in_vec[42:10]),
    .base_ei(in_vec[9:1]),
    .enable(in_vec[0:0]),
    .x2(out_vec[42:10]),
    .base_eo(out_vec[9:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h1fc85c2d0cb6b982ed42;
    stim[1] = 77'h19fbfa35332f2489b839;
    stim[2] = 77'h01290a2fe2660dee0abf;
    stim[3] = 77'h0ff796758335d4bf020c;
    stim[4] = 77'h08ef145f6fa9a103b3ac;
    stim[5] = 77'h0bb11ffcdd1b6e5076ad;
    stim[6] = 77'h0b0973e8e08b70c2ec09;
    stim[7] = 77'h0fba976215365e82583b;
    stim[8] = 77'h09c8c99385c0fd503d53;
    stim[9] = 77'h0f3da09219e5a388c873;
    stim[10] = 77'h04ac4acd82d7f4c99e24;
    stim[11] = 77'h0b5b494bfa8a3e883673;
    stim[12] = 77'h02cbdfb3cfed5f38b1c0;
    stim[13] = 77'h0014510463f4d9008eae;
    stim[14] = 77'h04bde5d7a6d6b8c1e806;
    stim[15] = 77'h07e41d2280b9397a5389;
    stim[16] = 77'h0b875c701bc0e5e4adf8;
    stim[17] = 77'h04b362230fe0633a4954;
    stim[18] = 77'h009bc8d6ebabce549c9b;
    stim[19] = 77'h0116fafe29be12282b35;
    stim[20] = 77'h0d3ac3d6797ee68189b2;
    stim[21] = 77'h00d4d5e5d1dc7c910297;
    stim[22] = 77'h0a0bec5ec6023afea682;
    stim[23] = 77'h01ba79421ba0e15bb058;
    stim[24] = 77'h062c66ba6fa73e227bd7;
    stim[25] = 77'h07a1f676d55b9922484a;
    stim[26] = 77'h0ae8705e691c2fac105d;
    stim[27] = 77'h02aec4171d41b17b1696;
    stim[28] = 77'h1ee2b95f2f4c5ff0eab4;
    stim[29] = 77'h08461a8ed86d3060c684;
    stim[30] = 77'h0fcd3ed5a157ee9655aa;
    stim[31] = 77'h1117e28e49efd4798346;
    stim[32] = 77'h04cade70a0a877bff8db;
    stim[33] = 77'h0d0fbc64780aa691713a;
    stim[34] = 77'h075dbcacb15ddb5ac811;
    stim[35] = 77'h0e010cdd6111d8387ae9;
    stim[36] = 77'h01e4df24559ade984d99;
    stim[37] = 77'h01da08e192d9f985e576;
    stim[38] = 77'h08e73c45ea532dd0ab5d;
    stim[39] = 77'h00465a8954fa877c3834;
    stim[40] = 77'h01c95d8b263d523fbb39;
    stim[41] = 77'h02a2cea64d823b03abc6;
    stim[42] = 77'h0849270b993cc427a0e2;
    stim[43] = 77'h0216fe55dc3e2ae2d3a7;
    stim[44] = 77'h01997919ed56f99a46c4;
    stim[45] = 77'h033e1e76b4a6077def26;
    stim[46] = 77'h053c2dd9295b7c2b59bd;
    stim[47] = 77'h000079db9efc811bc62a;
    stim[48] = 77'h03bfc07ed7a59c358f97;
    stim[49] = 77'h006b4cc538984aa1455a;
    stim[50] = 77'h06a4b5479bf9e2227f1f;
    stim[51] = 77'h078013da99474e8de761;
    stim[52] = 77'h03a56970b2323196a9bf;
    stim[53] = 77'h0410b4f228384cc6f104;
    stim[54] = 77'h014547b4f3ea8878ec72;
    stim[55] = 77'h06ef250daafffa604a65;
    stim[56] = 77'h0eaf622632e68d8579c4;
    stim[57] = 77'h0501b6e23c99f1899a77;
    stim[58] = 77'h07d684b93a3eeb67de3e;
    stim[59] = 77'h0c202ca0712d932976a4;
    stim[60] = 77'h0496da1602ac7a2afdad;
    stim[61] = 77'h0242f5ab3f93bcddf834;
    stim[62] = 77'h04df7d4ffa6237e679ea;
    stim[63] = 77'h03e7e864a171ebeb0302;
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
      expv[0] = 43'h00000000000;
      expv[1] = 43'h00000000000;
      expv[2] = 43'h00000000000;
      expv[3] = 43'h2fa9305fabf;
      expv[4] = 43'h2fa9305fabe;
      expv[5] = 43'h2fa9305fabe;
      expv[6] = 43'h2f3fe4ee2ad;
      expv[7] = 43'h4f949318409;
      expv[8] = 43'h513aa33603b;
      expv[9] = 43'h2a56219fd53;
      expv[10] = 43'h5b92cc04473;
      expv[11] = 43'h5b92cc04472;
      expv[12] = 43'h323661dca73;
      expv[13] = 43'h323661dca72;
      expv[14] = 43'h323661dca72;
      expv[15] = 43'h323661dca72;
      expv[16] = 43'h4ab480b9389;
      expv[17] = 43'h4ab480b9388;
      expv[18] = 43'h4ab480b9388;
      expv[19] = 43'h3f9b2c0109b;
      expv[20] = 43'h2498fa73f35;
      expv[21] = 43'h2498fa73f34;
      expv[22] = 43'h246e783ea97;
      expv[23] = 43'h246e783ea96;
      expv[24] = 43'h246e783ea96;
      expv[25] = 43'h36ef53abfd7;
      expv[26] = 43'h36ef53abfd6;
      expv[27] = 43'h4580883245d;
      expv[28] = 43'h00000000000;
      expv[29] = 43'h00000000000;
      expv[30] = 43'h00000000000;
      expv[31] = 43'h00000000000;
      expv[32] = 43'h00000000000;
      expv[33] = 43'h30de6f848db;
      expv[34] = 43'h30de6f848da;
      expv[35] = 43'h50cb9b12011;
      expv[36] = 43'h5eeae363ae9;
      expv[37] = 43'h35790f9dd99;
      expv[38] = 43'h35790f9dd98;
      expv[39] = 43'h22070524f5d;
      expv[40] = 43'h22070524f5c;
      expv[41] = 43'h2a75c85db39;
      expv[42] = 43'h2a75c85db38;
      expv[43] = 43'h2a75c85db38;
      expv[44] = 43'h4cd54481fa7;
      expv[45] = 43'h4cd54481fa6;
      expv[46] = 43'h4cd54481fa6;
      expv[47] = 43'h3f99317edbd;
      expv[48] = 43'h3f99317edbc;
      expv[49] = 43'h23a4409df97;
      expv[50] = 43'h23a4409df96;
      expv[51] = 43'h74c3cc64b1f;
      expv[52] = 43'h507587b3361;
      expv[53] = 43'h404e64f01bf;
      expv[54] = 43'h404e64f01be;
      expv[55] = 43'h404e64f01be;
      expv[56] = 43'h6778ce71e65;
      expv[57] = 43'h6778ce71e64;
      expv[58] = 43'h5e6e9e78677;
      expv[59] = 43'h5e6e9e78676;
      expv[60] = 43'h5e6e9e78676;
      expv[61] = 43'h4f7e735fdad;
      expv[62] = 43'h4f7e735fdac;
      expv[63] = 43'h4f7e735fdac;
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
