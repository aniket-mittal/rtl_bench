// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_fp17_mul_core_chn_b_rsci_chn_b_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[20:20]),
    .chn_b_rsci_oswt(in_vec[19:19]),
    .chn_b_rsci_biwt(in_vec[18:18]),
    .chn_b_rsci_bdwt(in_vec[17:17]),
    .chn_b_rsci_d(in_vec[16:0]),
    .chn_b_rsci_bawt(out_vec[18:18]),
    .chn_b_rsci_wen_comp(out_vec[17:17]),
    .chn_b_rsci_d_mxwt(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h00b01f;
    stim[1] = 21'h0c3011;
    stim[2] = 21'h19395f;
    stim[3] = 21'h1ec45f;
    stim[4] = 21'h14100d;
    stim[5] = 21'h1965ab;
    stim[6] = 21'h028f02;
    stim[7] = 21'h1d1cb1;
    stim[8] = 21'h16833a;
    stim[9] = 21'h1227d8;
    stim[10] = 21'h125d77;
    stim[11] = 21'h19e3af;
    stim[12] = 21'h1be716;
    stim[13] = 21'h1010ab;
    stim[14] = 21'h1f3a76;
    stim[15] = 21'h14216c;
    stim[16] = 21'h1f72ae;
    stim[17] = 21'h10ae28;
    stim[18] = 21'h157a48;
    stim[19] = 21'h18d104;
    stim[20] = 21'h1efbca;
    stim[21] = 21'h109b6c;
    stim[22] = 21'h1402b2;
    stim[23] = 21'h1b6046;
    stim[24] = 21'h151b23;
    stim[25] = 21'h137fba;
    stim[26] = 21'h179b2f;
    stim[27] = 21'h153626;
    stim[28] = 21'h1f18ae;
    stim[29] = 21'h1eb699;
    stim[30] = 21'h12b73e;
    stim[31] = 21'h1244cb;
    stim[32] = 21'h185450;
    stim[33] = 21'h10d47c;
    stim[34] = 21'h1e83aa;
    stim[35] = 21'h18d812;
    stim[36] = 21'h162c70;
    stim[37] = 21'h11265f;
    stim[38] = 21'h15eafe;
    stim[39] = 21'h066706;
    stim[40] = 21'h1fc79d;
    stim[41] = 21'h192f9a;
    stim[42] = 21'h1d2049;
    stim[43] = 21'h1269ae;
    stim[44] = 21'h105cc9;
    stim[45] = 21'h13d622;
    stim[46] = 21'h19a0b4;
    stim[47] = 21'h12bb17;
    stim[48] = 21'h10993f;
    stim[49] = 21'h1553cb;
    stim[50] = 21'h13c6af;
    stim[51] = 21'h161c1a;
    stim[52] = 21'h15f7a5;
    stim[53] = 21'h10dab3;
    stim[54] = 21'h1c8adf;
    stim[55] = 21'h18235c;
    stim[56] = 21'h1161a6;
    stim[57] = 21'h169a10;
    stim[58] = 21'h139151;
    stim[59] = 21'h1a19d6;
    stim[60] = 21'h1133a1;
    stim[61] = 21'h1e7ea9;
    stim[62] = 21'h1b6c86;
    stim[63] = 21'h1a14eb;
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
      expv[0] = 19'h2b01f;
      expv[1] = 19'h63011;
      expv[2] = 19'h1395f;
      expv[3] = 19'h6c45f;
      expv[4] = 19'h6100d;
      expv[5] = 19'h6100d;
      expv[6] = 19'h28f02;
      expv[7] = 19'h71cb1;
      expv[8] = 19'h71cb1;
      expv[9] = 19'h227d8;
      expv[10] = 19'h25d77;
      expv[11] = 19'h1e3af;
      expv[12] = 19'h1e716;
      expv[13] = 19'h210ab;
      expv[14] = 19'h73a76;
      expv[15] = 19'h6216c;
      expv[16] = 19'h6216c;
      expv[17] = 19'h2ae28;
      expv[18] = 19'h77a48;
      expv[19] = 19'h77a48;
      expv[20] = 19'h77a48;
      expv[21] = 19'h29b6c;
      expv[22] = 19'h602b2;
      expv[23] = 19'h602b2;
      expv[24] = 19'h71b23;
      expv[25] = 19'h71b23;
      expv[26] = 19'h79b2f;
      expv[27] = 19'h73626;
      expv[28] = 19'h73626;
      expv[29] = 19'h6b699;
      expv[30] = 19'h2b73e;
      expv[31] = 19'h244cb;
      expv[32] = 19'h05450;
      expv[33] = 19'h2d47c;
      expv[34] = 19'h683aa;
      expv[35] = 19'h0d812;
      expv[36] = 19'h62c70;
      expv[37] = 19'h3265f;
      expv[38] = 19'h7eafe;
      expv[39] = 19'h66706;
      expv[40] = 19'h7c79d;
      expv[41] = 19'h12f9a;
      expv[42] = 19'h72049;
      expv[43] = 19'h72049;
      expv[44] = 19'h25cc9;
      expv[45] = 19'h3d622;
      expv[46] = 19'h1a0b4;
      expv[47] = 19'h2bb17;
      expv[48] = 19'h2993f;
      expv[49] = 19'h753cb;
      expv[50] = 19'h753cb;
      expv[51] = 19'h61c1a;
      expv[52] = 19'h7f7a5;
      expv[53] = 19'h7f7a5;
      expv[54] = 19'h7f7a5;
      expv[55] = 19'h7f7a5;
      expv[56] = 19'h7f7a5;
      expv[57] = 19'h7f7a5;
      expv[58] = 19'h39151;
      expv[59] = 19'h019d6;
      expv[60] = 19'h333a1;
      expv[61] = 19'h67ea9;
      expv[62] = 19'h16c86;
      expv[63] = 19'h014eb;
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
