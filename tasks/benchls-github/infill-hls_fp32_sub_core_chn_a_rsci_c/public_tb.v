// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_fp32_sub_core_chn_a_rsci_chn_a_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[35:35]),
    .chn_a_rsci_oswt(in_vec[34:34]),
    .chn_a_rsci_biwt(in_vec[33:33]),
    .chn_a_rsci_bdwt(in_vec[32:32]),
    .chn_a_rsci_d(in_vec[31:0]),
    .chn_a_rsci_bawt(out_vec[33:33]),
    .chn_a_rsci_wen_comp(out_vec[32:32]),
    .chn_a_rsci_d_mxwt(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h78b065367;
    stim[1] = 36'h160e812ae;
    stim[2] = 36'hbc5f51a27;
    stim[3] = 36'hf4f1366cc;
    stim[4] = 36'hacb02c914;
    stim[5] = 36'h98a43120f;
    stim[6] = 36'ha1e6ac7d6;
    stim[7] = 36'hb6497f8c4;
    stim[8] = 36'hc01b41dc8;
    stim[9] = 36'hd58e07ce1;
    stim[10] = 36'haee85a420;
    stim[11] = 36'h8efbf61fd;
    stim[12] = 36'hce03e76eb;
    stim[13] = 36'hf68258fa0;
    stim[14] = 36'h86d384f9b;
    stim[15] = 36'ha4beca1d4;
    stim[16] = 36'h86c6def26;
    stim[17] = 36'hcf2a2c6e0;
    stim[18] = 36'h9134ee9d0;
    stim[19] = 36'hd5e0ab738;
    stim[20] = 36'h8a863a2e6;
    stim[21] = 36'he6aa0af11;
    stim[22] = 36'hcbbea62d1;
    stim[23] = 36'hc1c76e788;
    stim[24] = 36'h926d5bd10;
    stim[25] = 36'hcb2d5dc31;
    stim[26] = 36'h964acb907;
    stim[27] = 36'hb906fe403;
    stim[28] = 36'hc75291a35;
    stim[29] = 36'hcbf1fe7eb;
    stim[30] = 36'hd6e984c9d;
    stim[31] = 36'ha8f16d386;
    stim[32] = 36'h8f56bc096;
    stim[33] = 36'hfa943b7ca;
    stim[34] = 36'he160ceeac;
    stim[35] = 36'hf47a2ff0c;
    stim[36] = 36'hf2bdd97bd;
    stim[37] = 36'hd3d609fa6;
    stim[38] = 36'hf94fc4bdb;
    stim[39] = 36'hb8edeb8df;
    stim[40] = 36'ha9f1f4f39;
    stim[41] = 36'he0d955123;
    stim[42] = 36'haf3119429;
    stim[43] = 36'hd44f72337;
    stim[44] = 36'h89928e636;
    stim[45] = 36'h82c317c47;
    stim[46] = 36'hb58064755;
    stim[47] = 36'hc7abe7a42;
    stim[48] = 36'hd208483cb;
    stim[49] = 36'hb1cc49a86;
    stim[50] = 36'hcc83dbf39;
    stim[51] = 36'hbc3248f85;
    stim[52] = 36'h99fb32756;
    stim[53] = 36'he34a10e2a;
    stim[54] = 36'h9cfa25abf;
    stim[55] = 36'hfac19d78b;
    stim[56] = 36'ha45c18616;
    stim[57] = 36'hd8dd13785;
    stim[58] = 36'he6df14950;
    stim[59] = 36'hd0af3d032;
    stim[60] = 36'h9641dcc26;
    stim[61] = 36'hf7187f93c;
    stim[62] = 36'hc5738fda7;
    stim[63] = 36'hcca28d8ae;
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
      expv[0] = 34'h38b065367;
      expv[1] = 34'h160e812ae;
      expv[2] = 34'h3c5f51a27;
      expv[3] = 34'h34f1366cc;
      expv[4] = 34'h3cb02c914;
      expv[5] = 34'h3cb02c914;
      expv[6] = 34'h31e6ac7d6;
      expv[7] = 34'h31e6ac7d6;
      expv[8] = 34'h001b41dc8;
      expv[9] = 34'h058e07ce1;
      expv[10] = 34'h3ee85a420;
      expv[11] = 34'h3ee85a420;
      expv[12] = 34'h3ee85a420;
      expv[13] = 34'h3ee85a420;
      expv[14] = 34'h16d384f9b;
      expv[15] = 34'h34beca1d4;
      expv[16] = 34'h34beca1d4;
      expv[17] = 34'h34beca1d4;
      expv[18] = 34'h34beca1d4;
      expv[19] = 34'h05e0ab738;
      expv[20] = 34'h1a863a2e6;
      expv[21] = 34'h36aa0af11;
      expv[22] = 34'h36aa0af11;
      expv[23] = 34'h36aa0af11;
      expv[24] = 34'h36aa0af11;
      expv[25] = 34'h0b2d5dc31;
      expv[26] = 34'h164acb907;
      expv[27] = 34'h3906fe403;
      expv[28] = 34'h075291a35;
      expv[29] = 34'h0bf1fe7eb;
      expv[30] = 34'h06e984c9d;
      expv[31] = 34'h38f16d386;
      expv[32] = 34'h38f16d386;
      expv[33] = 34'h38f16d386;
      expv[34] = 34'h3160ceeac;
      expv[35] = 34'h3160ceeac;
      expv[36] = 34'h32bdd97bd;
      expv[37] = 34'h03d609fa6;
      expv[38] = 34'h394fc4bdb;
      expv[39] = 34'h38edeb8df;
      expv[40] = 34'h39f1f4f39;
      expv[41] = 34'h39f1f4f39;
      expv[42] = 34'h39f1f4f39;
      expv[43] = 34'h39f1f4f39;
      expv[44] = 34'h19928e636;
      expv[45] = 34'h12c317c47;
      expv[46] = 34'h358064755;
      expv[47] = 34'h07abe7a42;
      expv[48] = 34'h0208483cb;
      expv[49] = 34'h31cc49a86;
      expv[50] = 34'h0c83dbf39;
      expv[51] = 34'h3c3248f85;
      expv[52] = 34'h19fb32756;
      expv[53] = 34'h334a10e2a;
      expv[54] = 34'h334a10e2a;
      expv[55] = 34'h3ac19d78b;
      expv[56] = 34'h345c18616;
      expv[57] = 34'h345c18616;
      expv[58] = 34'h36df14950;
      expv[59] = 34'h36df14950;
      expv[60] = 34'h1641dcc26;
      expv[61] = 34'h37187f93c;
      expv[62] = 34'h05738fda7;
      expv[63] = 34'h0ca28d8ae;
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
