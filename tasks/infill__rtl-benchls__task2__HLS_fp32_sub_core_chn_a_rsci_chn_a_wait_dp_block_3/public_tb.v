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
    stim[0] = 36'h2fdc5b9db;
    stim[1] = 36'h5a223c4ad;
    stim[2] = 36'h811c72523;
    stim[3] = 36'h859942cfe;
    stim[4] = 36'hec84ca89b;
    stim[5] = 36'h86b5ec3ac;
    stim[6] = 36'hf7055c112;
    stim[7] = 36'he0ee9f9c9;
    stim[8] = 36'h8ec38a3ef;
    stim[9] = 36'he06f6938c;
    stim[10] = 36'hc7dfb425f;
    stim[11] = 36'hfacd78d96;
    stim[12] = 36'hc943bf049;
    stim[13] = 36'h946a3c609;
    stim[14] = 36'h87b669468;
    stim[15] = 36'heb739ee54;
    stim[16] = 36'hd9ba4937c;
    stim[17] = 36'h9f7d975d8;
    stim[18] = 36'h964ee4253;
    stim[19] = 36'h948978c97;
    stim[20] = 36'h9a95fe53a;
    stim[21] = 36'hc890ef0dc;
    stim[22] = 36'hadc1ae427;
    stim[23] = 36'h9b50a6fff;
    stim[24] = 36'heb26fbf7d;
    stim[25] = 36'h8bc806c07;
    stim[26] = 36'hccb7b8ed8;
    stim[27] = 36'hd790582c7;
    stim[28] = 36'hdc19f8ce9;
    stim[29] = 36'hd5d7fe1a6;
    stim[30] = 36'h9f6b1320d;
    stim[31] = 36'hd6b7316d8;
    stim[32] = 36'hed101f66b;
    stim[33] = 36'he81c53583;
    stim[34] = 36'hcd737fe08;
    stim[35] = 36'hf353e038a;
    stim[36] = 36'h909c5cf97;
    stim[37] = 36'he0d99bb15;
    stim[38] = 36'h831b9abcb;
    stim[39] = 36'hcd30edf69;
    stim[40] = 36'h8705bb496;
    stim[41] = 36'h9e6704158;
    stim[42] = 36'h68e64a10f;
    stim[43] = 36'hf7aea7a3e;
    stim[44] = 36'hcd194fa6e;
    stim[45] = 36'hb2e2e1fff;
    stim[46] = 36'hb69aa20c8;
    stim[47] = 36'hc87ff79e3;
    stim[48] = 36'ha0fb66ba3;
    stim[49] = 36'h9e94db586;
    stim[50] = 36'hea18c1b07;
    stim[51] = 36'hf8801ad03;
    stim[52] = 36'hf41ffd28a;
    stim[53] = 36'hfd5d17c90;
    stim[54] = 36'he91ad193f;
    stim[55] = 36'ha28a8ae31;
    stim[56] = 36'h9864c7f69;
    stim[57] = 36'hada763c0e;
    stim[58] = 36'h91bfa2c6c;
    stim[59] = 36'he60c3c3eb;
    stim[60] = 36'hfed406027;
    stim[61] = 36'heef5816bd;
    stim[62] = 36'hea93383e3;
    stim[63] = 36'he4c3a18f5;
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
      expv[0] = 34'h3fdc5b9db;
      expv[1] = 34'h0a223c4ad;
      expv[2] = 34'h111c72523;
      expv[3] = 34'h159942cfe;
      expv[4] = 34'h3c84ca89b;
      expv[5] = 34'h3c84ca89b;
      expv[6] = 34'h3c84ca89b;
      expv[7] = 34'h30ee9f9c9;
      expv[8] = 34'h30ee9f9c9;
      expv[9] = 34'h30ee9f9c9;
      expv[10] = 34'h30ee9f9c9;
      expv[11] = 34'h30ee9f9c9;
      expv[12] = 34'h0943bf049;
      expv[13] = 34'h146a3c609;
      expv[14] = 34'h17b669468;
      expv[15] = 34'h3b739ee54;
      expv[16] = 34'h3b739ee54;
      expv[17] = 34'h1f7d975d8;
      expv[18] = 34'h164ee4253;
      expv[19] = 34'h148978c97;
      expv[20] = 34'h1a95fe53a;
      expv[21] = 34'h0890ef0dc;
      expv[22] = 34'h3dc1ae427;
      expv[23] = 34'h3dc1ae427;
      expv[24] = 34'h3b26fbf7d;
      expv[25] = 34'h3b26fbf7d;
      expv[26] = 34'h3b26fbf7d;
      expv[27] = 34'h3b26fbf7d;
      expv[28] = 34'h0c19f8ce9;
      expv[29] = 34'h05d7fe1a6;
      expv[30] = 34'h1f6b1320d;
      expv[31] = 34'h06b7316d8;
      expv[32] = 34'h3d101f66b;
      expv[33] = 34'h3d101f66b;
      expv[34] = 34'h3d101f66b;
      expv[35] = 34'h3d101f66b;
      expv[36] = 34'h109c5cf97;
      expv[37] = 34'h30d99bb15;
      expv[38] = 34'h30d99bb15;
      expv[39] = 34'h30d99bb15;
      expv[40] = 34'h30d99bb15;
      expv[41] = 34'h30d99bb15;
      expv[42] = 34'h38e64a10f;
      expv[43] = 34'h37aea7a3e;
      expv[44] = 34'h0d194fa6e;
      expv[45] = 34'h32e2e1fff;
      expv[46] = 34'h369aa20c8;
      expv[47] = 34'h087ff79e3;
      expv[48] = 34'h30fb66ba3;
      expv[49] = 34'h30fb66ba3;
      expv[50] = 34'h3a18c1b07;
      expv[51] = 34'h3a18c1b07;
      expv[52] = 34'h341ffd28a;
      expv[53] = 34'h3d5d17c90;
      expv[54] = 34'h391ad193f;
      expv[55] = 34'h391ad193f;
      expv[56] = 34'h391ad193f;
      expv[57] = 34'h3da763c0e;
      expv[58] = 34'h3da763c0e;
      expv[59] = 34'h360c3c3eb;
      expv[60] = 34'h360c3c3eb;
      expv[61] = 34'h3ef5816bd;
      expv[62] = 34'h3ef5816bd;
      expv[63] = 34'h3ef5816bd;
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
