// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10897 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h1a2feda7762;
    stim[1] = 42'h1384496128a;
    stim[2] = 42'h30c06b768c0;
    stim[3] = 42'h335a7eaa974;
    stim[4] = 42'h1f5d1fcb3e6;
    stim[5] = 42'h33a51c3512e;
    stim[6] = 42'h2df462c05c9;
    stim[7] = 42'h330504bed4a;
    stim[8] = 42'h1788f5ad281;
    stim[9] = 42'h1edea4f1aec;
    stim[10] = 42'h1af2128fea7;
    stim[11] = 42'h0a5f53cb87a;
    stim[12] = 42'h3656772d2b8;
    stim[13] = 42'h2b949a16565;
    stim[14] = 42'h3c29a152ad7;
    stim[15] = 42'h37481e25293;
    stim[16] = 42'h27c8f0c8e3c;
    stim[17] = 42'h11a873a15f3;
    stim[18] = 42'h0dec49f9d2f;
    stim[19] = 42'h2743ee84ef2;
    stim[20] = 42'h096e236fd6c;
    stim[21] = 42'h3f7707c0fec;
    stim[22] = 42'h2ff8f21c6e3;
    stim[23] = 42'h01260924395;
    stim[24] = 42'h16f865d092d;
    stim[25] = 42'h12af37e4544;
    stim[26] = 42'h271840933b6;
    stim[27] = 42'h2d5c79a0b3d;
    stim[28] = 42'h114961bf0c0;
    stim[29] = 42'h22e243b065d;
    stim[30] = 42'h2b1fc930276;
    stim[31] = 42'h3e4e3cc4fa8;
    stim[32] = 42'h1976c41d52a;
    stim[33] = 42'h26a1a4074ce;
    stim[34] = 42'h1fb6685a77b;
    stim[35] = 42'h17c00b4b66e;
    stim[36] = 42'h39267329956;
    stim[37] = 42'h29ad87d83be;
    stim[38] = 42'h3840eb1536d;
    stim[39] = 42'h16538fcca38;
    stim[40] = 42'h16c70d0f797;
    stim[41] = 42'h01d8039b98f;
    stim[42] = 42'h0c97386b7ba;
    stim[43] = 42'h2bf65becd76;
    stim[44] = 42'h3c20170aa7f;
    stim[45] = 42'h20ac86809fb;
    stim[46] = 42'h1709111854d;
    stim[47] = 42'h3d69e908ba2;
    stim[48] = 42'h1290fd269fa;
    stim[49] = 42'h1d50a2505ba;
    stim[50] = 42'h100df6029c1;
    stim[51] = 42'h060697cf12f;
    stim[52] = 42'h26dc4c0cfc1;
    stim[53] = 42'h3beae01c2b6;
    stim[54] = 42'h1b6b758fbf3;
    stim[55] = 42'h1fe0b58a320;
    stim[56] = 42'h295f2cdd473;
    stim[57] = 42'h337ccd6d3bd;
    stim[58] = 42'h3c63e9372fe;
    stim[59] = 42'h223e0a5fca4;
    stim[60] = 42'h328114585cb;
    stim[61] = 42'h319ad884d1e;
    stim[62] = 42'h3ffdfcd94b8;
    stim[63] = 42'h1939c7481f5;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'hxxxxxxxxxx000;
      expv[8] = 51'h182825f6a4xxx;
      expv[9] = 51'h182825f6a4000;
      expv[10] = 51'h182825f6a4000;
      expv[11] = 51'h5790947f52020;
      expv[12] = 51'h5790947f52000;
      expv[13] = 51'h5790947f52000;
      expv[14] = 51'h5ca4d0b2b3000;
      expv[15] = 51'h5ca4d0b2b2000;
      expv[16] = 51'h5ca4d0b2b2000;
      expv[17] = 51'h5ca4d0b2b2000;
      expv[18] = 51'h0d439d0af8010;
      expv[19] = 51'h0d439d0af8000;
      expv[20] = 51'h0d439d0af8000;
      expv[21] = 51'h4b711b7eb6200;
      expv[22] = 51'h4b711b7eb6000;
      expv[23] = 51'h4b711b7eb6000;
      expv[24] = 51'h4b711b7eb6000;
      expv[25] = 51'h4b711b7eb6000;
      expv[26] = 51'h1579bf22a2001;
      expv[27] = 51'h1579bf22a2000;
      expv[28] = 51'h1579bf22a2000;
      expv[29] = 51'h1579bf22a2000;
      expv[30] = 51'h17121d832e001;
      expv[31] = 51'h17121d832e000;
      expv[32] = 51'h17121d832e000;
      expv[33] = 51'h17121d832e000;
      expv[34] = 51'h350d203a66040;
      expv[35] = 51'h350d203a66000;
      expv[36] = 51'h3e005a5b36040;
      expv[37] = 51'h3e005a5b36000;
      expv[38] = 51'h3e005a5b36000;
      expv[39] = 51'h3e005a5b36000;
      expv[40] = 51'h3e005a5b36000;
      expv[41] = 51'h3e005a5b36000;
      expv[42] = 51'h3e005a5b36000;
      expv[43] = 51'h3e005a5b36000;
      expv[44] = 51'h5fb2df66bb000;
      expv[45] = 51'h5fb2df66ba000;
      expv[46] = 51'h5fb2df66ba000;
      expv[47] = 51'h5fb2df66ba000;
      expv[48] = 51'h5fb2df66ba000;
      expv[49] = 51'h5fb2df66ba000;
      expv[50] = 51'h5fb2df66ba000;
      expv[51] = 51'h006fb014e0000;
      expv[52] = 51'h006fb014e0000;
      expv[53] = 51'h006fb014e0000;
      expv[54] = 51'h006fb014e0000;
      expv[55] = 51'h5b5bac7df8000;
      expv[56] = 51'h5b5bac7df8000;
      expv[57] = 51'h4af966ea38000;
      expv[58] = 51'h4af966ea38000;
      expv[59] = 51'h4af966ea38000;
      expv[60] = 51'h11f052fe52010;
      expv[61] = 51'h11f052fe52000;
      expv[62] = 51'h0cd6c4268e010;
      expv[63] = 51'h0cd6c4268e000;
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
