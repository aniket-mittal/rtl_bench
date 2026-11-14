// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .a(in_vec[19:16]),
    .b(in_vec[15:12]),
    .c(in_vec[11:8]),
    .d(in_vec[7:4]),
    .e(in_vec[3:0]),
    .q(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h90705;
    stim[1] = 20'h232bc;
    stim[2] = 20'hd4434;
    stim[3] = 20'h9e5e3;
    stim[4] = 20'h8542d;
    stim[5] = 20'h28034;
    stim[6] = 20'h4d40d;
    stim[7] = 20'h53845;
    stim[8] = 20'h37439;
    stim[9] = 20'ha6801;
    stim[10] = 20'h8397f;
    stim[11] = 20'h6a327;
    stim[12] = 20'hcdd7f;
    stim[13] = 20'h90c4d;
    stim[14] = 20'h365b2;
    stim[15] = 20'hbc71a;
    stim[16] = 20'he5f4c;
    stim[17] = 20'h4cfd3;
    stim[18] = 20'h9ab53;
    stim[19] = 20'h4d78e;
    stim[20] = 20'h1c9c3;
    stim[21] = 20'hccefd;
    stim[22] = 20'hec6b0;
    stim[23] = 20'h83699;
    stim[24] = 20'h7fcfb;
    stim[25] = 20'h084c6;
    stim[26] = 20'h3f390;
    stim[27] = 20'h66a8e;
    stim[28] = 20'h12f92;
    stim[29] = 20'h9fe43;
    stim[30] = 20'h54ce3;
    stim[31] = 20'h339d9;
    stim[32] = 20'hc7bd0;
    stim[33] = 20'h2d8d5;
    stim[34] = 20'h0b4db;
    stim[35] = 20'h07d4e;
    stim[36] = 20'hc5761;
    stim[37] = 20'h53a7c;
    stim[38] = 20'ha89c5;
    stim[39] = 20'h00c21;
    stim[40] = 20'h8884f;
    stim[41] = 20'hf14f3;
    stim[42] = 20'hda470;
    stim[43] = 20'hf9bbd;
    stim[44] = 20'h0af94;
    stim[45] = 20'hb88b4;
    stim[46] = 20'h32071;
    stim[47] = 20'h0a3a4;
    stim[48] = 20'hf7c92;
    stim[49] = 20'h660e4;
    stim[50] = 20'h38120;
    stim[51] = 20'h326f9;
    stim[52] = 20'hdac39;
    stim[53] = 20'h7864c;
    stim[54] = 20'h8ef8e;
    stim[55] = 20'h79529;
    stim[56] = 20'h47ca3;
    stim[57] = 20'h2e98d;
    stim[58] = 20'h5154a;
    stim[59] = 20'h9dfed;
    stim[60] = 20'hb6b53;
    stim[61] = 20'h8bdb9;
    stim[62] = 20'h2951a;
    stim[63] = 20'h6a880;
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
      expv[0] = 4'hf;
      expv[1] = 4'h2;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'h8;
      expv[6] = 4'hf;
      expv[7] = 4'hf;
      expv[8] = 4'hf;
      expv[9] = 4'hf;
      expv[10] = 4'hf;
      expv[11] = 4'h2;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'hf;
      expv[19] = 4'hf;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'hf;
      expv[25] = 4'hf;
      expv[26] = 4'h9;
      expv[27] = 4'hf;
      expv[28] = 4'hf;
      expv[29] = 4'hf;
      expv[30] = 4'hf;
      expv[31] = 4'hf;
      expv[32] = 4'hf;
      expv[33] = 4'hf;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'hf;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'h2;
      expv[47] = 4'ha;
      expv[48] = 4'hf;
      expv[49] = 4'h6;
      expv[50] = 4'h0;
      expv[51] = 4'hf;
      expv[52] = 4'hf;
      expv[53] = 4'hf;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hf;
      expv[57] = 4'hf;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'hf;
      expv[63] = 4'hf;
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
