// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  align_mux dut (
    .clk(clk),
    .align(in_vec[38:36]),
    .in_data(in_vec[35:4]),
    .in_charisk(in_vec[3:0]),
    .out_data(out_vec[35:4]),
    .out_charisk(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h43c628bd0b;
    stim[1] = 39'h0cabfa07fd;
    stim[2] = 39'h1bc86d902d;
    stim[3] = 39'h677ad3ff63;
    stim[4] = 39'h41b4216347;
    stim[5] = 39'h3f718f7e97;
    stim[6] = 39'h126c904885;
    stim[7] = 39'h3cfba95611;
    stim[8] = 39'h78b2943853;
    stim[9] = 39'h25ae937517;
    stim[10] = 39'h5abcc0134a;
    stim[11] = 39'h57269de749;
    stim[12] = 39'h4c68e99f33;
    stim[13] = 39'h293543e762;
    stim[14] = 39'h0ec154b4f8;
    stim[15] = 39'h15e3b8da11;
    stim[16] = 39'h57d2cdee64;
    stim[17] = 39'h2abfcf6af4;
    stim[18] = 39'h6e6d418416;
    stim[19] = 39'h2309323453;
    stim[20] = 39'h3b24363119;
    stim[21] = 39'h2b7aad6f96;
    stim[22] = 39'h3d1489c9a2;
    stim[23] = 39'h39a242aa1c;
    stim[24] = 39'h4dd9ebd7c4;
    stim[25] = 39'h0a74f89280;
    stim[26] = 39'h1f0f9f88b6;
    stim[27] = 39'h7bd637921f;
    stim[28] = 39'h1ad1eaa81b;
    stim[29] = 39'h61c23ab44c;
    stim[30] = 39'h73e46106cb;
    stim[31] = 39'h7ccc657a21;
    stim[32] = 39'h7d44a8bcb8;
    stim[33] = 39'h05a25aa7e8;
    stim[34] = 39'h6fe7449341;
    stim[35] = 39'h58771cb4e0;
    stim[36] = 39'h69996e6beb;
    stim[37] = 39'h716760c67e;
    stim[38] = 39'h170eeacc4f;
    stim[39] = 39'h4980668e8a;
    stim[40] = 39'h25e3288c22;
    stim[41] = 39'h3fc36f9fc5;
    stim[42] = 39'h667767c4f8;
    stim[43] = 39'h3a52a20123;
    stim[44] = 39'h49768a4595;
    stim[45] = 39'h02a081f172;
    stim[46] = 39'h04f283976a;
    stim[47] = 39'h5c312a9a90;
    stim[48] = 39'h6160c50631;
    stim[49] = 39'h055d1b8841;
    stim[50] = 39'h58723851f8;
    stim[51] = 39'h72c1ff8bd6;
    stim[52] = 39'h522114989f;
    stim[53] = 39'h40383653f9;
    stim[54] = 39'h5975cba897;
    stim[55] = 39'h0c3378aa8e;
    stim[56] = 39'h0e0afba2f9;
    stim[57] = 39'h3c36656673;
    stim[58] = 39'h7b90b27efc;
    stim[59] = 39'h196306d03f;
    stim[60] = 39'h7cd0bf0840;
    stim[61] = 39'h2ea1a9cb24;
    stim[62] = 39'h2052d24e23;
    stim[63] = 39'h122773628e;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'h3c628bd0b;
      expv[2] = 36'h02cabfa0e;
      expv[3] = 36'h3ff6bc86f;
      expv[4] = 36'h77ad3ff63;
      expv[5] = 36'h18f7e91be;
      expv[6] = 36'h88f718f7b;
      expv[7] = 36'hba9561262;
      expv[8] = 36'h294385cf6;
      expv[9] = 36'h37518b29c;
      expv[10] = 36'h345ae9373;
      expv[11] = 36'h74abcc01d;
      expv[12] = 36'h7269de749;
      expv[13] = 36'h3e76c68e8;
      expv[14] = 36'h93543e762;
      expv[15] = 36'ha1ec154bc;
      expv[16] = 36'he65e3b8d0;
      expv[17] = 36'hf6af7d2c1;
      expv[18] = 36'h1841abfc9;
      expv[19] = 36'h2345e6d4d;
      expv[20] = 36'h436311302;
      expv[21] = 36'hd6f9b243a;
      expv[22] = 36'h489c9ab74;
      expv[23] = 36'h242aa1d18;
      expv[24] = 36'h9a242aa1c;
      expv[25] = 36'hdd9ebd7c4;
      expv[26] = 36'h8ba74f890;
      expv[27] = 36'h637921f0e;
      expv[28] = 36'h81bd6379f;
      expv[29] = 36'hab44ad1e2;
      expv[30] = 36'h46106c1c7;
      expv[31] = 36'hc657a23e3;
      expv[32] = 36'h4a8bcbcc0;
      expv[33] = 36'hd44a8bcb8;
      expv[34] = 36'h49345a256;
      expv[35] = 36'h4efe74490;
      expv[36] = 36'he6be8771c;
      expv[37] = 36'h760c6799d;
      expv[38] = 36'hc416760cf;
      expv[39] = 36'h70eeacc4f;
      expv[40] = 36'h88c29806a;
      expv[41] = 36'h36f9fc5ea;
      expv[42] = 36'h7c4ffc361;
      expv[43] = 36'h2a2012677;
      expv[44] = 36'ha52a20123;
      expv[45] = 36'h9768a4595;
      expv[46] = 36'h2a081f172;
      expv[47] = 36'ha94f28395;
      expv[48] = 36'h5063c3124;
      expv[49] = 36'h160c50631;
      expv[50] = 36'h1f55d1b80;
      expv[51] = 36'h1ff8bd87d;
      expv[52] = 36'h892c1ff8b;
      expv[53] = 36'h22114989f;
      expv[54] = 36'h89038365c;
      expv[55] = 36'h975cba897;
      expv[56] = 36'hc3378aa8e;
      expv[57] = 36'h665667e07;
      expv[58] = 36'h0b27efc38;
      expv[59] = 36'h03b90b27e;
      expv[60] = 36'h0bf084961;
      expv[61] = 36'h9cb2cd0b0;
      expv[62] = 36'h24e2ea1ad;
      expv[63] = 36'h28052d241;
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
