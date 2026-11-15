// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_122334 dut (
    .clk(clk),
    .RegWriteW(in_vec[40:40]),
    .RegWriteM(in_vec[39:39]),
    .RegWriteE(in_vec[38:38]),
    .WriteRegW(in_vec[37:33]),
    .WriteRegM(in_vec[32:28]),
    .WriteRegE(in_vec[27:23]),
    .MemToRegM(in_vec[22:22]),
    .MemToRegE(in_vec[21:21]),
    .rsE(in_vec[20:16]),
    .rtE(in_vec[15:11]),
    .rsD(in_vec[10:6]),
    .rtD(in_vec[5:1]),
    .BranchD(in_vec[0:0]),
    .ForwardAE(out_vec[8:7]),
    .ForwardBE(out_vec[6:5]),
    .ForwardAD(out_vec[4:4]),
    .ForwardBD(out_vec[3:3]),
    .FlushE(out_vec[2:2]),
    .StallD(out_vec[1:1]),
    .StallF(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h173f1c3d7a7;
    stim[1] = 41'h0196428477c;
    stim[2] = 41'h182ff43d58f;
    stim[3] = 41'h08a9d82eccc;
    stim[4] = 41'h1838eeaa223;
    stim[5] = 41'h0901ad79120;
    stim[6] = 41'h1080bb46d47;
    stim[7] = 41'h016d54e86a5;
    stim[8] = 41'h11de5c2adfc;
    stim[9] = 41'h0c244b20453;
    stim[10] = 41'h19f92f86f94;
    stim[11] = 41'h0e7e9885a0b;
    stim[12] = 41'h1d48cd1913e;
    stim[13] = 41'h0cf1da9a7f0;
    stim[14] = 41'h05933039064;
    stim[15] = 41'h17fe0ff71ef;
    stim[16] = 41'h09ca12c5bed;
    stim[17] = 41'h1070f784a92;
    stim[18] = 41'h16a9e6d04f4;
    stim[19] = 41'h0e68747706c;
    stim[20] = 41'h01b2e0caac6;
    stim[21] = 41'h01a5d84b034;
    stim[22] = 41'h1f96f5e1802;
    stim[23] = 41'h1d346aa80b0;
    stim[24] = 41'h0771935fcf1;
    stim[25] = 41'h08f95784994;
    stim[26] = 41'h0de8c94d3cc;
    stim[27] = 41'h00a8532a390;
    stim[28] = 41'h07f169882e6;
    stim[29] = 41'h185e3325f49;
    stim[30] = 41'h18a5492c497;
    stim[31] = 41'h1daefffd29b;
    stim[32] = 41'h035fe90a5c3;
    stim[33] = 41'h15f4b6f7834;
    stim[34] = 41'h0644c7c4a22;
    stim[35] = 41'h18ed786eecb;
    stim[36] = 41'h0c58661a822;
    stim[37] = 41'h1ec5236001b;
    stim[38] = 41'h1f55520feb0;
    stim[39] = 41'h05fc0e35605;
    stim[40] = 41'h0fac80d2138;
    stim[41] = 41'h174ff223025;
    stim[42] = 41'h0350d901b43;
    stim[43] = 41'h03252da52f9;
    stim[44] = 41'h069118dd9cc;
    stim[45] = 41'h040cf14afcb;
    stim[46] = 41'h1a5c1f63b08;
    stim[47] = 41'h09780c3c6ad;
    stim[48] = 41'h0721d3dcadf;
    stim[49] = 41'h0f26b028b8c;
    stim[50] = 41'h0acb3c34b36;
    stim[51] = 41'h0e9546bab44;
    stim[52] = 41'h02052aaf3fd;
    stim[53] = 41'h10605b3e4d1;
    stim[54] = 41'h02ac0a3397f;
    stim[55] = 41'h1e885dc9439;
    stim[56] = 41'h0db22adbf90;
    stim[57] = 41'h1059660c6bb;
    stim[58] = 41'h12e5cd07208;
    stim[59] = 41'h11a4e5f7937;
    stim[60] = 41'h16080d0eb99;
    stim[61] = 41'h0e9e1eb4f62;
    stim[62] = 41'h13c9441a18c;
    stim[63] = 41'h04bee369eb2;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h007;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h080;
      expv[16] = 9'h000;
      expv[17] = 9'h007;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h0a0;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h087;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h040;
      expv[48] = 9'h000;
      expv[49] = 9'h008;
      expv[50] = 9'h000;
      expv[51] = 9'h040;
      expv[52] = 9'h007;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h007;
      expv[60] = 9'h080;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
