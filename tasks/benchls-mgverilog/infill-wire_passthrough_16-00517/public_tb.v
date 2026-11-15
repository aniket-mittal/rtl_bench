// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00517 dut (
    .in(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h88e1;
    stim[1] = 16'h2423;
    stim[2] = 16'ha7f1;
    stim[3] = 16'h0446;
    stim[4] = 16'h1524;
    stim[5] = 16'h8a4b;
    stim[6] = 16'h7966;
    stim[7] = 16'ha7b5;
    stim[8] = 16'h40b5;
    stim[9] = 16'hda09;
    stim[10] = 16'h3a8e;
    stim[11] = 16'hc21e;
    stim[12] = 16'h22aa;
    stim[13] = 16'h50b8;
    stim[14] = 16'h5f93;
    stim[15] = 16'h314c;
    stim[16] = 16'h8e0e;
    stim[17] = 16'he4c4;
    stim[18] = 16'h6be7;
    stim[19] = 16'h1d1d;
    stim[20] = 16'h3a9f;
    stim[21] = 16'h8f0d;
    stim[22] = 16'h452d;
    stim[23] = 16'h91a4;
    stim[24] = 16'hfb9e;
    stim[25] = 16'h4492;
    stim[26] = 16'h80dc;
    stim[27] = 16'hbf98;
    stim[28] = 16'h4fbc;
    stim[29] = 16'h6d4e;
    stim[30] = 16'h8832;
    stim[31] = 16'had04;
    stim[32] = 16'h20aa;
    stim[33] = 16'h7d70;
    stim[34] = 16'hde24;
    stim[35] = 16'h04a3;
    stim[36] = 16'h381c;
    stim[37] = 16'h6e05;
    stim[38] = 16'hdac2;
    stim[39] = 16'h75eb;
    stim[40] = 16'hf4b5;
    stim[41] = 16'hfaec;
    stim[42] = 16'hffd1;
    stim[43] = 16'h5623;
    stim[44] = 16'h22ac;
    stim[45] = 16'hda22;
    stim[46] = 16'h1c5a;
    stim[47] = 16'hc777;
    stim[48] = 16'hf254;
    stim[49] = 16'hc188;
    stim[50] = 16'h6733;
    stim[51] = 16'h24fd;
    stim[52] = 16'hb400;
    stim[53] = 16'h853c;
    stim[54] = 16'h09df;
    stim[55] = 16'hbef1;
    stim[56] = 16'h7eec;
    stim[57] = 16'hdedc;
    stim[58] = 16'hfef8;
    stim[59] = 16'h37c7;
    stim[60] = 16'h6dd3;
    stim[61] = 16'h33a1;
    stim[62] = 16'hb898;
    stim[63] = 16'h562a;
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
      expv[0] = 16'h88e1;
      expv[1] = 16'h2423;
      expv[2] = 16'ha7f1;
      expv[3] = 16'h0446;
      expv[4] = 16'h1524;
      expv[5] = 16'h8a4b;
      expv[6] = 16'h7966;
      expv[7] = 16'ha7b5;
      expv[8] = 16'h40b5;
      expv[9] = 16'hda09;
      expv[10] = 16'h3a8e;
      expv[11] = 16'hc21e;
      expv[12] = 16'h22aa;
      expv[13] = 16'h50b8;
      expv[14] = 16'h5f93;
      expv[15] = 16'h314c;
      expv[16] = 16'h8e0e;
      expv[17] = 16'he4c4;
      expv[18] = 16'h6be7;
      expv[19] = 16'h1d1d;
      expv[20] = 16'h3a9f;
      expv[21] = 16'h8f0d;
      expv[22] = 16'h452d;
      expv[23] = 16'h91a4;
      expv[24] = 16'hfb9e;
      expv[25] = 16'h4492;
      expv[26] = 16'h80dc;
      expv[27] = 16'hbf98;
      expv[28] = 16'h4fbc;
      expv[29] = 16'h6d4e;
      expv[30] = 16'h8832;
      expv[31] = 16'had04;
      expv[32] = 16'h20aa;
      expv[33] = 16'h7d70;
      expv[34] = 16'hde24;
      expv[35] = 16'h04a3;
      expv[36] = 16'h381c;
      expv[37] = 16'h6e05;
      expv[38] = 16'hdac2;
      expv[39] = 16'h75eb;
      expv[40] = 16'hf4b5;
      expv[41] = 16'hfaec;
      expv[42] = 16'hffd1;
      expv[43] = 16'h5623;
      expv[44] = 16'h22ac;
      expv[45] = 16'hda22;
      expv[46] = 16'h1c5a;
      expv[47] = 16'hc777;
      expv[48] = 16'hf254;
      expv[49] = 16'hc188;
      expv[50] = 16'h6733;
      expv[51] = 16'h24fd;
      expv[52] = 16'hb400;
      expv[53] = 16'h853c;
      expv[54] = 16'h09df;
      expv[55] = 16'hbef1;
      expv[56] = 16'h7eec;
      expv[57] = 16'hdedc;
      expv[58] = 16'hfef8;
      expv[59] = 16'h37c7;
      expv[60] = 16'h6dd3;
      expv[61] = 16'h33a1;
      expv[62] = 16'hb898;
      expv[63] = 16'h562a;
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
