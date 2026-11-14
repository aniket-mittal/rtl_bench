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

  dut dut (
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
    stim[0] = 20'h7e70a;
    stim[1] = 20'h44a59;
    stim[2] = 20'h307df;
    stim[3] = 20'h1bce3;
    stim[4] = 20'h1d86f;
    stim[5] = 20'h37c52;
    stim[6] = 20'hbf4c2;
    stim[7] = 20'hea91c;
    stim[8] = 20'h23420;
    stim[9] = 20'hb8514;
    stim[10] = 20'h3bbd3;
    stim[11] = 20'h0751b;
    stim[12] = 20'h6bb7b;
    stim[13] = 20'h8f76c;
    stim[14] = 20'hb0225;
    stim[15] = 20'h8775d;
    stim[16] = 20'h589b8;
    stim[17] = 20'h9bd80;
    stim[18] = 20'hcfa3e;
    stim[19] = 20'he2d0b;
    stim[20] = 20'hc017d;
    stim[21] = 20'hf03ab;
    stim[22] = 20'ha98ce;
    stim[23] = 20'he22fc;
    stim[24] = 20'h60887;
    stim[25] = 20'hd36de;
    stim[26] = 20'h7ae6b;
    stim[27] = 20'h231ac;
    stim[28] = 20'h82ee4;
    stim[29] = 20'h73d3b;
    stim[30] = 20'ha96ff;
    stim[31] = 20'h095d8;
    stim[32] = 20'ha52a5;
    stim[33] = 20'hede35;
    stim[34] = 20'h29adf;
    stim[35] = 20'h3a999;
    stim[36] = 20'h467d8;
    stim[37] = 20'hfe7c3;
    stim[38] = 20'h7e3cb;
    stim[39] = 20'h3e0d2;
    stim[40] = 20'h278c7;
    stim[41] = 20'h7d904;
    stim[42] = 20'h5b200;
    stim[43] = 20'h1f628;
    stim[44] = 20'h8e1dc;
    stim[45] = 20'h50d72;
    stim[46] = 20'h654a5;
    stim[47] = 20'he9fd3;
    stim[48] = 20'hdb26c;
    stim[49] = 20'h08c19;
    stim[50] = 20'ha91c3;
    stim[51] = 20'h7fc94;
    stim[52] = 20'h0d21d;
    stim[53] = 20'h6c8bf;
    stim[54] = 20'h3888b;
    stim[55] = 20'h166dc;
    stim[56] = 20'h125b6;
    stim[57] = 20'h1f816;
    stim[58] = 20'h0079d;
    stim[59] = 20'h9179c;
    stim[60] = 20'hf362d;
    stim[61] = 20'hb7b42;
    stim[62] = 20'he786e;
    stim[63] = 20'h40403;
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
      expv[0] = 4'he;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'hc;
      expv[8] = 4'h2;
      expv[9] = 4'h4;
      expv[10] = 4'hf;
      expv[11] = 4'hb;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'hb;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'h3;
      expv[19] = 4'h2;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'hf;
      expv[25] = 4'hf;
      expv[26] = 4'hf;
      expv[27] = 4'hf;
      expv[28] = 4'hf;
      expv[29] = 4'h3;
      expv[30] = 4'hf;
      expv[31] = 4'hf;
      expv[32] = 4'hf;
      expv[33] = 4'h3;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'hf;
      expv[41] = 4'hd;
      expv[42] = 4'hb;
      expv[43] = 4'h1;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hf;
      expv[47] = 4'hf;
      expv[48] = 4'hf;
      expv[49] = 4'h9;
      expv[50] = 4'hf;
      expv[51] = 4'hf;
      expv[52] = 4'hd;
      expv[53] = 4'hf;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hf;
      expv[57] = 4'h6;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'hf;
      expv[63] = 4'h0;
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
