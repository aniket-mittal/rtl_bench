// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01465 dut (
    .a(in_vec[12:8]),
    .b(in_vec[7:0]),
    .p(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h17ea;
    stim[1] = 13'h0040;
    stim[2] = 13'h0e2a;
    stim[3] = 13'h0988;
    stim[4] = 13'h063f;
    stim[5] = 13'h1736;
    stim[6] = 13'h1ed7;
    stim[7] = 13'h14bc;
    stim[8] = 13'h1abd;
    stim[9] = 13'h1c6d;
    stim[10] = 13'h07cf;
    stim[11] = 13'h0b43;
    stim[12] = 13'h11ac;
    stim[13] = 13'h15ee;
    stim[14] = 13'h0c57;
    stim[15] = 13'h001c;
    stim[16] = 13'h17e2;
    stim[17] = 13'h083b;
    stim[18] = 13'h121e;
    stim[19] = 13'h1028;
    stim[20] = 13'h1779;
    stim[21] = 13'h03c9;
    stim[22] = 13'h012a;
    stim[23] = 13'h10ad;
    stim[24] = 13'h1775;
    stim[25] = 13'h1634;
    stim[26] = 13'h0c2a;
    stim[27] = 13'h04d7;
    stim[28] = 13'h1e9b;
    stim[29] = 13'h1738;
    stim[30] = 13'h19b3;
    stim[31] = 13'h1b66;
    stim[32] = 13'h1828;
    stim[33] = 13'h0b25;
    stim[34] = 13'h18a7;
    stim[35] = 13'h065e;
    stim[36] = 13'h1253;
    stim[37] = 13'h0df2;
    stim[38] = 13'h0b46;
    stim[39] = 13'h0d25;
    stim[40] = 13'h04ca;
    stim[41] = 13'h1d28;
    stim[42] = 13'h0102;
    stim[43] = 13'h1642;
    stim[44] = 13'h12d6;
    stim[45] = 13'h1f6d;
    stim[46] = 13'h0864;
    stim[47] = 13'h0b7a;
    stim[48] = 13'h02ae;
    stim[49] = 13'h0a76;
    stim[50] = 13'h0906;
    stim[51] = 13'h02a7;
    stim[52] = 13'h18b5;
    stim[53] = 13'h1cb9;
    stim[54] = 13'h0c5a;
    stim[55] = 13'h1b4f;
    stim[56] = 13'h0469;
    stim[57] = 13'h0719;
    stim[58] = 13'h0533;
    stim[59] = 13'h15e6;
    stim[60] = 13'h0a2b;
    stim[61] = 13'h0748;
    stim[62] = 13'h1a06;
    stim[63] = 13'h1727;
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
      expv[0] = 16'hfe06;
      expv[1] = 16'h0000;
      expv[2] = 16'h024c;
      expv[3] = 16'hfbc8;
      expv[4] = 16'h017a;
      expv[5] = 16'h04da;
      expv[6] = 16'hfb32;
      expv[7] = 16'hfab0;
      expv[8] = 16'hf932;
      expv[9] = 16'h0bec;
      expv[10] = 16'hfea9;
      expv[11] = 16'h02e1;
      expv[12] = 16'hfa6c;
      expv[13] = 16'hfe86;
      expv[14] = 16'h0414;
      expv[15] = 16'h0000;
      expv[16] = 16'hfd4e;
      expv[17] = 16'h01d8;
      expv[18] = 16'h021c;
      expv[19] = 16'h0280;
      expv[20] = 16'h0adf;
      expv[21] = 16'hff5b;
      expv[22] = 16'h002a;
      expv[23] = 16'hfad0;
      expv[24] = 16'h0a83;
      expv[25] = 16'h0478;
      expv[26] = 16'h01f8;
      expv[27] = 16'hff5c;
      expv[28] = 16'hf42a;
      expv[29] = 16'h0508;
      expv[30] = 16'hf87b;
      expv[31] = 16'h0ac2;
      expv[32] = 16'h03c0;
      expv[33] = 16'h0197;
      expv[34] = 16'hf7a8;
      expv[35] = 16'h0234;
      expv[36] = 16'h05d6;
      expv[37] = 16'hff4a;
      expv[38] = 16'h0302;
      expv[39] = 16'h01e1;
      expv[40] = 16'hff28;
      expv[41] = 16'h0488;
      expv[42] = 16'h0002;
      expv[43] = 16'h05ac;
      expv[44] = 16'hfd0c;
      expv[45] = 16'h0d33;
      expv[46] = 16'h0320;
      expv[47] = 16'h053e;
      expv[48] = 16'hff5c;
      expv[49] = 16'h049c;
      expv[50] = 16'h0036;
      expv[51] = 16'hff4e;
      expv[52] = 16'hf8f8;
      expv[53] = 16'hf83c;
      expv[54] = 16'h0438;
      expv[55] = 16'h0855;
      expv[56] = 16'h01a4;
      expv[57] = 16'h00af;
      expv[58] = 16'h00ff;
      expv[59] = 16'hfdde;
      expv[60] = 16'h01ae;
      expv[61] = 16'h01f8;
      expv[62] = 16'h009c;
      expv[63] = 16'h0381;
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
