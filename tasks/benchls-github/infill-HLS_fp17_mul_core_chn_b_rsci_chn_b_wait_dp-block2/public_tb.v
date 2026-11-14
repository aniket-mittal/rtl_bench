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
    stim[0] = 21'h061b8a;
    stim[1] = 21'h0da0ae;
    stim[2] = 21'h19c325;
    stim[3] = 21'h179e4f;
    stim[4] = 21'h16444f;
    stim[5] = 21'h1b720e;
    stim[6] = 21'h1d8674;
    stim[7] = 21'h199273;
    stim[8] = 21'h179425;
    stim[9] = 21'h1ce5a2;
    stim[10] = 21'h1c4fb1;
    stim[11] = 21'h170ab9;
    stim[12] = 21'h16169e;
    stim[13] = 21'h174a94;
    stim[14] = 21'h1d5f34;
    stim[15] = 21'h1715b8;
    stim[16] = 21'h117f8e;
    stim[17] = 21'h1e6de6;
    stim[18] = 21'h1e2698;
    stim[19] = 21'h1e0b88;
    stim[20] = 21'h10a59e;
    stim[21] = 21'h104d78;
    stim[22] = 21'h1071c5;
    stim[23] = 21'h1b7efc;
    stim[24] = 21'h125b04;
    stim[25] = 21'h1e7f1e;
    stim[26] = 21'h100773;
    stim[27] = 21'h1cb83e;
    stim[28] = 21'h120b55;
    stim[29] = 21'h06cb81;
    stim[30] = 21'h146cca;
    stim[31] = 21'h1c2d19;
    stim[32] = 21'h11ec98;
    stim[33] = 21'h1e0a28;
    stim[34] = 21'h094277;
    stim[35] = 21'h1e6565;
    stim[36] = 21'h151efb;
    stim[37] = 21'h1a8355;
    stim[38] = 21'h16767b;
    stim[39] = 21'h1dfb32;
    stim[40] = 21'h19733a;
    stim[41] = 21'h11e53c;
    stim[42] = 21'h1d94c0;
    stim[43] = 21'h182c27;
    stim[44] = 21'h1f429d;
    stim[45] = 21'h19ad2b;
    stim[46] = 21'h115b9b;
    stim[47] = 21'h13e50d;
    stim[48] = 21'h1432e1;
    stim[49] = 21'h150ae0;
    stim[50] = 21'h122066;
    stim[51] = 21'h140c4e;
    stim[52] = 21'h1f1f9d;
    stim[53] = 21'h1df917;
    stim[54] = 21'h1f34b1;
    stim[55] = 21'h1ec4e8;
    stim[56] = 21'h1f09be;
    stim[57] = 21'h13f702;
    stim[58] = 21'h13ed83;
    stim[59] = 21'h14dbff;
    stim[60] = 21'h1e54ab;
    stim[61] = 21'h13a2c0;
    stim[62] = 21'h1bca6e;
    stim[63] = 21'h11fb56;
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
      expv[0] = 19'h61b8a;
      expv[1] = 19'h7a0ae;
      expv[2] = 19'h1c325;
      expv[3] = 19'h79e4f;
      expv[4] = 19'h6444f;
      expv[5] = 19'h1720e;
      expv[6] = 19'h78674;
      expv[7] = 19'h78674;
      expv[8] = 19'h78674;
      expv[9] = 19'h6e5a2;
      expv[10] = 19'h6e5a2;
      expv[11] = 19'h6e5a2;
      expv[12] = 19'h6169e;
      expv[13] = 19'h74a94;
      expv[14] = 19'h75f34;
      expv[15] = 19'h75f34;
      expv[16] = 19'h37f8e;
      expv[17] = 19'h66de6;
      expv[18] = 19'h62698;
      expv[19] = 19'h60b88;
      expv[20] = 19'h2a59e;
      expv[21] = 19'h24d78;
      expv[22] = 19'h271c5;
      expv[23] = 19'h17efc;
      expv[24] = 19'h25b04;
      expv[25] = 19'h67f1e;
      expv[26] = 19'h20773;
      expv[27] = 19'h6b83e;
      expv[28] = 19'h6b83e;
      expv[29] = 19'h6cb81;
      expv[30] = 19'h66cca;
      expv[31] = 19'h66cca;
      expv[32] = 19'h66cca;
      expv[33] = 19'h66cca;
      expv[34] = 19'h14277;
      expv[35] = 19'h66565;
      expv[36] = 19'h71efb;
      expv[37] = 19'h71efb;
      expv[38] = 19'h6767b;
      expv[39] = 19'h7fb32;
      expv[40] = 19'h7fb32;
      expv[41] = 19'h7fb32;
      expv[42] = 19'h7fb32;
      expv[43] = 19'h7fb32;
      expv[44] = 19'h7fb32;
      expv[45] = 19'h1ad2b;
      expv[46] = 19'h35b9b;
      expv[47] = 19'h3e50d;
      expv[48] = 19'h632e1;
      expv[49] = 19'h632e1;
      expv[50] = 19'h632e1;
      expv[51] = 19'h60c4e;
      expv[52] = 19'h60c4e;
      expv[53] = 19'h7f917;
      expv[54] = 19'h7f917;
      expv[55] = 19'h6c4e8;
      expv[56] = 19'h709be;
      expv[57] = 19'h3f702;
      expv[58] = 19'h3ed83;
      expv[59] = 19'h6dbff;
      expv[60] = 19'h6dbff;
      expv[61] = 19'h3a2c0;
      expv[62] = 19'h1ca6e;
      expv[63] = 19'h3fb56;
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
