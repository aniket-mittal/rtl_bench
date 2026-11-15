// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02174 dut (
    .bin(in_vec[15:0]),
    .bcd(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h7215;
    stim[1] = 16'ha629;
    stim[2] = 16'hb547;
    stim[3] = 16'h6501;
    stim[4] = 16'h869d;
    stim[5] = 16'h21e2;
    stim[6] = 16'hc6ab;
    stim[7] = 16'h3be7;
    stim[8] = 16'h873f;
    stim[9] = 16'h8e6e;
    stim[10] = 16'h65ac;
    stim[11] = 16'h460c;
    stim[12] = 16'hca53;
    stim[13] = 16'hece8;
    stim[14] = 16'h6f46;
    stim[15] = 16'hf894;
    stim[16] = 16'h84e3;
    stim[17] = 16'h60d6;
    stim[18] = 16'h58c9;
    stim[19] = 16'hcbf8;
    stim[20] = 16'h641f;
    stim[21] = 16'h0750;
    stim[22] = 16'hda60;
    stim[23] = 16'h9fe4;
    stim[24] = 16'h0a90;
    stim[25] = 16'h39a5;
    stim[26] = 16'hb86d;
    stim[27] = 16'hc67f;
    stim[28] = 16'h08b2;
    stim[29] = 16'hc90c;
    stim[30] = 16'h6f57;
    stim[31] = 16'hfcfb;
    stim[32] = 16'h60f4;
    stim[33] = 16'he6e7;
    stim[34] = 16'h51d9;
    stim[35] = 16'hbc58;
    stim[36] = 16'hdc18;
    stim[37] = 16'ha8d8;
    stim[38] = 16'h7e7d;
    stim[39] = 16'h6001;
    stim[40] = 16'h05e5;
    stim[41] = 16'h8221;
    stim[42] = 16'haca9;
    stim[43] = 16'h8a89;
    stim[44] = 16'hdc8c;
    stim[45] = 16'h973d;
    stim[46] = 16'h24f6;
    stim[47] = 16'hac25;
    stim[48] = 16'h6fae;
    stim[49] = 16'h3c81;
    stim[50] = 16'h6630;
    stim[51] = 16'h276f;
    stim[52] = 16'h7e6d;
    stim[53] = 16'h1962;
    stim[54] = 16'h9153;
    stim[55] = 16'h1845;
    stim[56] = 16'he4a3;
    stim[57] = 16'hb459;
    stim[58] = 16'hea34;
    stim[59] = 16'he598;
    stim[60] = 16'hf4f7;
    stim[61] = 16'h6780;
    stim[62] = 16'h3d39;
    stim[63] = 16'h2e0e;
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
      expv[0] = 20'h29205;
      expv[1] = 20'h42537;
      expv[2] = 20'h46407;
      expv[3] = 20'h25857;
      expv[4] = 20'h34461;
      expv[5] = 20'h08674;
      expv[6] = 20'h50859;
      expv[7] = 20'h15335;
      expv[8] = 20'h34623;
      expv[9] = 20'h36462;
      expv[10] = 20'h26028;
      expv[11] = 20'h17932;
      expv[12] = 20'h51795;
      expv[13] = 20'h60648;
      expv[14] = 20'h28486;
      expv[15] = 20'h63636;
      expv[16] = 20'h34019;
      expv[17] = 20'h24790;
      expv[18] = 20'h22729;
      expv[19] = 20'h52216;
      expv[20] = 20'h25631;
      expv[21] = 20'h01872;
      expv[22] = 20'h55904;
      expv[23] = 20'h40932;
      expv[24] = 20'h02704;
      expv[25] = 20'h14757;
      expv[26] = 20'h47213;
      expv[27] = 20'h50815;
      expv[28] = 20'h02226;
      expv[29] = 20'h51468;
      expv[30] = 20'h28503;
      expv[31] = 20'h64763;
      expv[32] = 20'h24820;
      expv[33] = 20'h59111;
      expv[34] = 20'h20953;
      expv[35] = 20'h48216;
      expv[36] = 20'h56344;
      expv[37] = 20'h43224;
      expv[38] = 20'h32381;
      expv[39] = 20'h24577;
      expv[40] = 20'h01509;
      expv[41] = 20'h33313;
      expv[42] = 20'h44201;
      expv[43] = 20'h35465;
      expv[44] = 20'h56460;
      expv[45] = 20'h38717;
      expv[46] = 20'h09462;
      expv[47] = 20'h44069;
      expv[48] = 20'h28590;
      expv[49] = 20'h15489;
      expv[50] = 20'h26160;
      expv[51] = 20'h10095;
      expv[52] = 20'h32365;
      expv[53] = 20'h06498;
      expv[54] = 20'h37203;
      expv[55] = 20'h06213;
      expv[56] = 20'h58531;
      expv[57] = 20'h46169;
      expv[58] = 20'h59956;
      expv[59] = 20'h58776;
      expv[60] = 20'h62711;
      expv[61] = 20'h26496;
      expv[62] = 20'h15673;
      expv[63] = 20'h11790;
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
