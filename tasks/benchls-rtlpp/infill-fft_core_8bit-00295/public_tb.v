// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00295 dut (
    .clk(clk),
    .reset_n(in_vec[23:23]),
    .inverse(in_vec[22:22]),
    .sink_valid(in_vec[21:21]),
    .sink_sop(in_vec[20:20]),
    .sink_eop(in_vec[19:19]),
    .sink_real(in_vec[18:11]),
    .sink_imag(in_vec[10:3]),
    .sink_error(in_vec[2:1]),
    .source_ready(in_vec[0:0]),
    .sink_ready(out_vec[27:27]),
    .source_error(out_vec[26:25]),
    .source_sop(out_vec[24:24]),
    .source_eop(out_vec[23:23]),
    .source_valid(out_vec[22:22]),
    .source_exp(out_vec[21:16]),
    .source_real(out_vec[15:8]),
    .source_imag(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h6b6947;
    stim[1] = 24'h5a3e96;
    stim[2] = 24'hb18176;
    stim[3] = 24'hdd13c5;
    stim[4] = 24'hc956b2;
    stim[5] = 24'he10296;
    stim[6] = 24'hdf6e63;
    stim[7] = 24'h979a82;
    stim[8] = 24'hb0a6c5;
    stim[9] = 24'h9647a8;
    stim[10] = 24'hf101ec;
    stim[11] = 24'hd7b92b;
    stim[12] = 24'hb44c9c;
    stim[13] = 24'hf2f3b8;
    stim[14] = 24'h801caf;
    stim[15] = 24'h6369e3;
    stim[16] = 24'hdfa1fe;
    stim[17] = 24'hc2ef2e;
    stim[18] = 24'h8f9e58;
    stim[19] = 24'hbce314;
    stim[20] = 24'h9288d9;
    stim[21] = 24'h86d478;
    stim[22] = 24'hc0846d;
    stim[23] = 24'he2a759;
    stim[24] = 24'h81b58b;
    stim[25] = 24'hf469b3;
    stim[26] = 24'hf66f52;
    stim[27] = 24'hf67c0f;
    stim[28] = 24'had33e8;
    stim[29] = 24'hf1ba96;
    stim[30] = 24'hc8d719;
    stim[31] = 24'heb1c9d;
    stim[32] = 24'hbbb077;
    stim[33] = 24'hdd7489;
    stim[34] = 24'haf47b2;
    stim[35] = 24'h87c354;
    stim[36] = 24'h84c2bf;
    stim[37] = 24'hac31a6;
    stim[38] = 24'hbd4303;
    stim[39] = 24'hf5bd25;
    stim[40] = 24'h84d4d2;
    stim[41] = 24'hcb2ae6;
    stim[42] = 24'he89fed;
    stim[43] = 24'hf835fa;
    stim[44] = 24'h58b135;
    stim[45] = 24'hc1aeac;
    stim[46] = 24'he73f96;
    stim[47] = 24'h9810df;
    stim[48] = 24'hf4febb;
    stim[49] = 24'h8307f1;
    stim[50] = 24'h94b2a1;
    stim[51] = 24'hac044c;
    stim[52] = 24'hfb0040;
    stim[53] = 24'h93a2fd;
    stim[54] = 24'he3f35d;
    stim[55] = 24'ha45af8;
    stim[56] = 24'hfb33f7;
    stim[57] = 24'hffed15;
    stim[58] = 24'hede023;
    stim[59] = 24'hb944ff;
    stim[60] = 24'he6863b;
    stim[61] = 24'h9c29c2;
    stim[62] = 24'h9b1ed5;
    stim[63] = 24'ha07a62;
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
      expv[0] = 28'h0000000;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h940302e;
      expv[4] = 28'h180a278;
      expv[5] = 28'h0802ad6;
      expv[6] = 28'h8402052;
      expv[7] = 28'h180edcc;
      expv[8] = 28'h100f350;
      expv[9] = 28'h94014d8;
      expv[10] = 28'h100c8f5;
      expv[11] = 28'h940203d;
      expv[12] = 28'h100f725;
      expv[13] = 28'h9408993;
      expv[14] = 28'h9405e77;
      expv[15] = 28'h0000000;
      expv[16] = 28'h0000000;
      expv[17] = 28'h180f43f;
      expv[18] = 28'h0005de5;
      expv[19] = 28'h080f3cb;
      expv[20] = 28'h9c09c62;
      expv[21] = 28'h100511b;
      expv[22] = 28'h000da8f;
      expv[23] = 28'h000108d;
      expv[24] = 28'h84054eb;
      expv[25] = 28'h00036b1;
      expv[26] = 28'h9408d36;
      expv[27] = 28'h940cdea;
      expv[28] = 28'h940cf81;
      expv[29] = 28'h8c0a67d;
      expv[30] = 28'h9403752;
      expv[31] = 28'h0801ae3;
      expv[32] = 28'h8c06393;
      expv[33] = 28'h9c0760e;
      expv[34] = 28'h180ae91;
      expv[35] = 28'h8c0e8f6;
      expv[36] = 28'h000f86a;
      expv[37] = 28'h0009857;
      expv[38] = 28'h8c08634;
      expv[39] = 28'h9c0a860;
      expv[40] = 28'h940b7a4;
      expv[41] = 28'h0009a9a;
      expv[42] = 28'h080655c;
      expv[43] = 28'h8c013fd;
      expv[44] = 28'h0000000;
      expv[45] = 28'h0000000;
      expv[46] = 28'h00035d5;
      expv[47] = 28'h840e7f2;
      expv[48] = 28'h180021b;
      expv[49] = 28'h9409fd7;
      expv[50] = 28'h00060fe;
      expv[51] = 28'h1009654;
      expv[52] = 28'h8c08089;
      expv[53] = 28'h9c06008;
      expv[54] = 28'h100745f;
      expv[55] = 28'h8407e6b;
      expv[56] = 28'h8408b5f;
      expv[57] = 28'h9c0667e;
      expv[58] = 28'h9c0fda2;
      expv[59] = 28'h8c0bc04;
      expv[60] = 28'h9c0289f;
      expv[61] = 28'h840d0c7;
      expv[62] = 28'h1808538;
      expv[63] = 28'h18063da;
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
