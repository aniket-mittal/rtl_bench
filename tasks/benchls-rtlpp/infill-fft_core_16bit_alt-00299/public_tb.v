// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00299 dut (
    .clk(clk),
    .reset_n(in_vec[39:39]),
    .inverse(in_vec[38:38]),
    .sink_valid(in_vec[37:37]),
    .sink_sop(in_vec[36:36]),
    .sink_eop(in_vec[35:35]),
    .sink_real(in_vec[34:19]),
    .sink_imag(in_vec[18:3]),
    .sink_error(in_vec[2:1]),
    .source_ready(in_vec[0:0]),
    .sink_ready(out_vec[43:43]),
    .source_error(out_vec[42:41]),
    .source_sop(out_vec[40:40]),
    .source_eop(out_vec[39:39]),
    .source_valid(out_vec[38:38]),
    .source_exp(out_vec[37:32]),
    .source_real(out_vec[31:16]),
    .source_imag(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h11095a8fb9;
    stim[1] = 40'h0130a8dc2b;
    stim[2] = 40'hc34b1bac8d;
    stim[3] = 40'hadee0e952f;
    stim[4] = 40'ha330cf0a23;
    stim[5] = 40'hf450c2157c;
    stim[6] = 40'he5c1827b13;
    stim[7] = 40'he5febcb509;
    stim[8] = 40'hd05d9a2898;
    stim[9] = 40'hd37d6265c5;
    stim[10] = 40'hc6f892cd4b;
    stim[11] = 40'hb41d079b67;
    stim[12] = 40'he0845b779e;
    stim[13] = 40'h8e7cff29c7;
    stim[14] = 40'hc9ad9db46d;
    stim[15] = 40'hf2272956c5;
    stim[16] = 40'hefae65a6fb;
    stim[17] = 40'h9159c087fd;
    stim[18] = 40'h90f35beb71;
    stim[19] = 40'hf6b86e0ef2;
    stim[20] = 40'he091a8c13f;
    stim[21] = 40'hde3fdc1642;
    stim[22] = 40'hd2baf1b31b;
    stim[23] = 40'hd9f056eaa6;
    stim[24] = 40'h0cd4478fdb;
    stim[25] = 40'hb80677ab20;
    stim[26] = 40'hd44a537fab;
    stim[27] = 40'hd1625cab56;
    stim[28] = 40'he80bd0a093;
    stim[29] = 40'h87d36c2420;
    stim[30] = 40'h99242a88fd;
    stim[31] = 40'he8e5c9f915;
    stim[32] = 40'hcbe50ef17f;
    stim[33] = 40'hce85fc655e;
    stim[34] = 40'h1c207a49f0;
    stim[35] = 40'h85bd728644;
    stim[36] = 40'h9792a66350;
    stim[37] = 40'h928a12c937;
    stim[38] = 40'he239b3a6a6;
    stim[39] = 40'hdde686e787;
    stim[40] = 40'h89f2e5f8b8;
    stim[41] = 40'ha2d0b04b81;
    stim[42] = 40'hfef406765a;
    stim[43] = 40'h9ef17864cb;
    stim[44] = 40'hd20db45964;
    stim[45] = 40'h9064f07d69;
    stim[46] = 40'hf17746d00c;
    stim[47] = 40'he664c4d234;
    stim[48] = 40'h99b5735d52;
    stim[49] = 40'hcd44cb1410;
    stim[50] = 40'he5d1feb80c;
    stim[51] = 40'ha5a43bff5e;
    stim[52] = 40'ha5f65de8fa;
    stim[53] = 40'hbcf41b5c5e;
    stim[54] = 40'he0b8cbe335;
    stim[55] = 40'hef20bf7171;
    stim[56] = 40'hc0522cfb01;
    stim[57] = 40'hbb20c1dad0;
    stim[58] = 40'hea31d2a46f;
    stim[59] = 40'hc28d7c9c8f;
    stim[60] = 40'hea67d04614;
    stim[61] = 40'ha40db0f3a8;
    stim[62] = 40'h989e11401d;
    stim[63] = 40'hb0dd0b0a2e;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h00000000000;
      expv[2] = 44'h00000000000;
      expv[3] = 44'h00000000000;
      expv[4] = 44'hec0bdc1d2a5;
      expv[5] = 44'ha406619e144;
      expv[6] = 44'h2006619e144;
      expv[7] = 44'ha40b8304f62;
      expv[8] = 44'h840bfd796a1;
      expv[9] = 44'h000bfd796a1;
      expv[10] = 44'h000bfd796a1;
      expv[11] = 44'h000bfd796a1;
      expv[12] = 44'hf4083a0f36c;
      expv[13] = 44'h70083a0f36c;
      expv[14] = 44'h70083a0f36c;
      expv[15] = 44'h70083a0f36c;
      expv[16] = 44'hd4044e52ad8;
      expv[17] = 44'hac0f5ccb4df;
      expv[18] = 44'h280f5ccb4df;
      expv[19] = 44'h280f5ccb4df;
      expv[20] = 44'h280f5ccb4df;
      expv[21] = 44'he4012351827;
      expv[22] = 44'h60012351827;
      expv[23] = 44'h60012351827;
      expv[24] = 44'h00000000000;
      expv[25] = 44'h00000000000;
      expv[26] = 44'h00000000000;
      expv[27] = 44'h00000000000;
      expv[28] = 44'h00000000000;
      expv[29] = 44'hac0017a1412;
      expv[30] = 44'h280017a1412;
      expv[31] = 44'h280017a1412;
      expv[32] = 44'hcc01cb93f22;
      expv[33] = 44'h4801cb93f22;
      expv[34] = 44'h00000000000;
      expv[35] = 44'h00000000000;
      expv[36] = 44'h00000000000;
      expv[37] = 44'h00000000000;
      expv[38] = 44'h00000000000;
      expv[39] = 44'h00000000000;
      expv[40] = 44'h00000000000;
      expv[41] = 44'h00000000000;
      expv[42] = 44'h8405a160970;
      expv[43] = 44'h0005a160970;
      expv[44] = 44'h0005a160970;
      expv[45] = 44'h0005a160970;
      expv[46] = 44'h0005a160970;
      expv[47] = 44'h0005a160970;
      expv[48] = 44'h0005a160970;
      expv[49] = 44'h0005a160970;
      expv[50] = 44'h0005a160970;
      expv[51] = 44'h0005a160970;
      expv[52] = 44'h0005a160970;
      expv[53] = 44'h0005a160970;
      expv[54] = 44'h0005a160970;
      expv[55] = 44'hc4017197c66;
      expv[56] = 44'h8c0e417ee2e;
      expv[57] = 44'h080e417ee2e;
      expv[58] = 44'h080e417ee2e;
      expv[59] = 44'hec0463a548d;
      expv[60] = 44'h680463a548d;
      expv[61] = 44'h680463a548d;
      expv[62] = 44'h680463a548d;
      expv[63] = 44'h680463a548d;
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
