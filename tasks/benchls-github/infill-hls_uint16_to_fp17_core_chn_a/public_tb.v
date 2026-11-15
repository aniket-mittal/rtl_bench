// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_uint16_to_fp17_core_chn_a_rsci_chn_a_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[19:19]),
    .chn_a_rsci_oswt(in_vec[18:18]),
    .chn_a_rsci_biwt(in_vec[17:17]),
    .chn_a_rsci_bdwt(in_vec[16:16]),
    .chn_a_rsci_d(in_vec[15:0]),
    .chn_a_rsci_bawt(out_vec[17:17]),
    .chn_a_rsci_wen_comp(out_vec[16:16]),
    .chn_a_rsci_d_mxwt(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h1984e;
    stim[1] = 20'h0d145;
    stim[2] = 20'h88570;
    stim[3] = 20'hb9ba2;
    stim[4] = 20'ha04cb;
    stim[5] = 20'hcc1e8;
    stim[6] = 20'ha8d3e;
    stim[7] = 20'had54a;
    stim[8] = 20'hbb184;
    stim[9] = 20'hb6b2a;
    stim[10] = 20'hf3808;
    stim[11] = 20'h9a51a;
    stim[12] = 20'hcb86e;
    stim[13] = 20'hdc8c5;
    stim[14] = 20'hb6b95;
    stim[15] = 20'hb7fd4;
    stim[16] = 20'hc7cdf;
    stim[17] = 20'hd13e0;
    stim[18] = 20'he8a05;
    stim[19] = 20'hf9638;
    stim[20] = 20'h864f3;
    stim[21] = 20'hd37f6;
    stim[22] = 20'h55b5c;
    stim[23] = 20'hb1a8a;
    stim[24] = 20'hc8e4a;
    stim[25] = 20'he5448;
    stim[26] = 20'he9cf9;
    stim[27] = 20'ha5672;
    stim[28] = 20'hd9665;
    stim[29] = 20'hd210b;
    stim[30] = 20'he8445;
    stim[31] = 20'haa869;
    stim[32] = 20'h9645a;
    stim[33] = 20'ha9e9f;
    stim[34] = 20'ha0909;
    stim[35] = 20'hde9c4;
    stim[36] = 20'hc897a;
    stim[37] = 20'he89a8;
    stim[38] = 20'h8ec7c;
    stim[39] = 20'hdfbfb;
    stim[40] = 20'hf42ec;
    stim[41] = 20'he6846;
    stim[42] = 20'hcff81;
    stim[43] = 20'ha0b07;
    stim[44] = 20'hd8fea;
    stim[45] = 20'h67045;
    stim[46] = 20'ha04b7;
    stim[47] = 20'hfb46a;
    stim[48] = 20'h96578;
    stim[49] = 20'hbb5a1;
    stim[50] = 20'ha640e;
    stim[51] = 20'h8490c;
    stim[52] = 20'h985fe;
    stim[53] = 20'he1147;
    stim[54] = 20'hcd482;
    stim[55] = 20'hf5f89;
    stim[56] = 20'h836f0;
    stim[57] = 20'hb7359;
    stim[58] = 20'h829e6;
    stim[59] = 20'hf9729;
    stim[60] = 20'he33e7;
    stim[61] = 20'he42b3;
    stim[62] = 20'h4756d;
    stim[63] = 20'hd5883;
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
      expv[0] = 18'h1984e;
      expv[1] = 18'h1d145;
      expv[2] = 18'h18570;
      expv[3] = 18'h39ba2;
      expv[4] = 18'h304cb;
      expv[5] = 18'h304cb;
      expv[6] = 18'h304cb;
      expv[7] = 18'h304cb;
      expv[8] = 18'h304cb;
      expv[9] = 18'h36b2a;
      expv[10] = 18'h33808;
      expv[11] = 18'h1a51a;
      expv[12] = 18'h0b86e;
      expv[13] = 18'h0c8c5;
      expv[14] = 18'h36b95;
      expv[15] = 18'h37fd4;
      expv[16] = 18'h07cdf;
      expv[17] = 18'h013e0;
      expv[18] = 18'h38a05;
      expv[19] = 18'h38a05;
      expv[20] = 18'h164f3;
      expv[21] = 18'h037f6;
      expv[22] = 18'h05b5c;
      expv[23] = 18'h31a8a;
      expv[24] = 18'h08e4a;
      expv[25] = 18'h35448;
      expv[26] = 18'h35448;
      expv[27] = 18'h35448;
      expv[28] = 18'h35448;
      expv[29] = 18'h0210b;
      expv[30] = 18'h38445;
      expv[31] = 18'h38445;
      expv[32] = 18'h38445;
      expv[33] = 18'h39e9f;
      expv[34] = 18'h39e9f;
      expv[35] = 18'h39e9f;
      expv[36] = 18'h0897a;
      expv[37] = 18'h389a8;
      expv[38] = 18'h389a8;
      expv[39] = 18'h389a8;
      expv[40] = 18'h342ec;
      expv[41] = 18'h36846;
      expv[42] = 18'h36846;
      expv[43] = 18'h36846;
      expv[44] = 18'h36846;
      expv[45] = 18'h37045;
      expv[46] = 18'h304b7;
      expv[47] = 18'h304b7;
      expv[48] = 18'h16578;
      expv[49] = 18'h3b5a1;
      expv[50] = 18'h3640e;
      expv[51] = 18'h3640e;
      expv[52] = 18'h3640e;
      expv[53] = 18'h31147;
      expv[54] = 18'h31147;
      expv[55] = 18'h31147;
      expv[56] = 18'h136f0;
      expv[57] = 18'h37359;
      expv[58] = 18'h129e6;
      expv[59] = 18'h39729;
      expv[60] = 18'h333e7;
      expv[61] = 18'h333e7;
      expv[62] = 18'h0756d;
      expv[63] = 18'h05883;
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
