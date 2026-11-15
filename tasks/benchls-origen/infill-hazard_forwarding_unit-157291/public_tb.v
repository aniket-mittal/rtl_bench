// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_157291 dut (
    .rsD(in_vec[40:36]),
    .rtD(in_vec[35:31]),
    .rsE(in_vec[30:26]),
    .rtE(in_vec[25:21]),
    .memtoregE(in_vec[20:20]),
    .memtoregM(in_vec[19:19]),
    .regwriteE(in_vec[18:18]),
    .regwriteM(in_vec[17:17]),
    .regwriteW(in_vec[16:16]),
    .writeregE(in_vec[15:11]),
    .writeregM(in_vec[10:6]),
    .writeregW(in_vec[5:1]),
    .branchD(in_vec[0:0]),
    .stallF(out_vec[6:6]),
    .stallD(out_vec[5:5]),
    .forwardAD(out_vec[4:4]),
    .forwardBD(out_vec[3:3]),
    .forwardAE(out_vec[2:2]),
    .forwardBE(out_vec[1:1]),
    .flushE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h117378c9c8b;
    stim[1] = 41'h0dafc60cee0;
    stim[2] = 41'h0892b111f4f;
    stim[3] = 41'h08fe126d517;
    stim[4] = 41'h0f88d53b422;
    stim[5] = 41'h1f544dc75e7;
    stim[6] = 41'h1e7475a115e;
    stim[7] = 41'h127603d0d60;
    stim[8] = 41'h0a9aae29a7c;
    stim[9] = 41'h0df64b6c018;
    stim[10] = 41'h0315aeb52c8;
    stim[11] = 41'h1ee5464c6dd;
    stim[12] = 41'h0b447dd9282;
    stim[13] = 41'h1308e1aa004;
    stim[14] = 41'h17f6e350871;
    stim[15] = 41'h097908f2df6;
    stim[16] = 41'h09cc6c09f30;
    stim[17] = 41'h125cf6ae629;
    stim[18] = 41'h004a1a3f1e4;
    stim[19] = 41'h108823bef15;
    stim[20] = 41'h124b4d1f94e;
    stim[21] = 41'h07b6c0175c6;
    stim[22] = 41'h1fb01a50f38;
    stim[23] = 41'h1eb95738089;
    stim[24] = 41'h02227f0a300;
    stim[25] = 41'h1065ad01e91;
    stim[26] = 41'h1c8d56b5bc7;
    stim[27] = 41'h100bcf5d1f3;
    stim[28] = 41'h05cf2798bda;
    stim[29] = 41'h0a33fac04e9;
    stim[30] = 41'h1575c53eb8e;
    stim[31] = 41'h08d53ef2d14;
    stim[32] = 41'h04d383d28cd;
    stim[33] = 41'h017b5ae7387;
    stim[34] = 41'h1db4eff37c9;
    stim[35] = 41'h0bfaab558e6;
    stim[36] = 41'h1dad948dd6b;
    stim[37] = 41'h088df14e7f6;
    stim[38] = 41'h0725597c348;
    stim[39] = 41'h063f843cefb;
    stim[40] = 41'h0c3bbce29a3;
    stim[41] = 41'h1228eb0ff2e;
    stim[42] = 41'h0733b8d4217;
    stim[43] = 41'h0a3d2e942c9;
    stim[44] = 41'h1ff3f50b197;
    stim[45] = 41'h19dfe438673;
    stim[46] = 41'h0a12a5bb867;
    stim[47] = 41'h0ae8686a48d;
    stim[48] = 41'h19b7b70d419;
    stim[49] = 41'h0496dd92ec0;
    stim[50] = 41'h0509e8bd1be;
    stim[51] = 41'h00ac8a8bf16;
    stim[52] = 41'h0b1ee5a237e;
    stim[53] = 41'h1dd41d11942;
    stim[54] = 41'h0787eb163c3;
    stim[55] = 41'h02298aebc84;
    stim[56] = 41'h0e4eaf037a9;
    stim[57] = 41'h193ab750fd5;
    stim[58] = 41'h19dc97fc6fb;
    stim[59] = 41'h1d098184cf9;
    stim[60] = 41'h10dd58ccd88;
    stim[61] = 41'h1c7097ec1a5;
    stim[62] = 41'h10e5b5ded0d;
    stim[63] = 41'h1eb88d6deeb;
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
      expv[0] = 7'h00;
      expv[1] = 7'h00;
      expv[2] = 7'h00;
      expv[3] = 7'h00;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h00;
      expv[7] = 7'h00;
      expv[8] = 7'h00;
      expv[9] = 7'h00;
      expv[10] = 7'h00;
      expv[11] = 7'h00;
      expv[12] = 7'h00;
      expv[13] = 7'h00;
      expv[14] = 7'h00;
      expv[15] = 7'h00;
      expv[16] = 7'h00;
      expv[17] = 7'h00;
      expv[18] = 7'h00;
      expv[19] = 7'h60;
      expv[20] = 7'h00;
      expv[21] = 7'h00;
      expv[22] = 7'h00;
      expv[23] = 7'h00;
      expv[24] = 7'h00;
      expv[25] = 7'h00;
      expv[26] = 7'h00;
      expv[27] = 7'h00;
      expv[28] = 7'h00;
      expv[29] = 7'h00;
      expv[30] = 7'h00;
      expv[31] = 7'h00;
      expv[32] = 7'h00;
      expv[33] = 7'h00;
      expv[34] = 7'h00;
      expv[35] = 7'h10;
      expv[36] = 7'h00;
      expv[37] = 7'h00;
      expv[38] = 7'h00;
      expv[39] = 7'h00;
      expv[40] = 7'h00;
      expv[41] = 7'h00;
      expv[42] = 7'h00;
      expv[43] = 7'h00;
      expv[44] = 7'h00;
      expv[45] = 7'h61;
      expv[46] = 7'h00;
      expv[47] = 7'h00;
      expv[48] = 7'h00;
      expv[49] = 7'h00;
      expv[50] = 7'h00;
      expv[51] = 7'h00;
      expv[52] = 7'h00;
      expv[53] = 7'h00;
      expv[54] = 7'h00;
      expv[55] = 7'h00;
      expv[56] = 7'h00;
      expv[57] = 7'h04;
      expv[58] = 7'h61;
      expv[59] = 7'h00;
      expv[60] = 7'h00;
      expv[61] = 7'h00;
      expv[62] = 7'h00;
      expv[63] = 7'h00;
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
